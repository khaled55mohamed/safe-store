import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safe_store/modules/information.dart';
import 'package:safe_store/pages/insert_page.dart';
import 'package:safe_store/services/database.dart';
import 'package:safe_store/pages/show_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Store'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: () => setState(() {
              Fluttertoast.showToast(
                msg: "Data Refreashed!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.green[400],
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
            ),
            onPressed: () => _goToAddNewInfo(context),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<QuerySnapshot>(
            future: DataBaseServices().accountsReference.get(),
            builder: (context, snapshot) {
              Widget mainBuild = Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                List<AccountInfo> accountsList = List();
                for (var doc in documents)
                  accountsList.add(
                    AccountInfo.online(
                      doc.get('idCode'),
                      doc.get('userName'),
                      doc.get('password'),
                      doc.get('website'),
                    ),
                  );
                mainBuild = ListView.builder(
                  itemCount: accountsList.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(accountsList[index].userName),
                      subtitle: Text(accountsList[index].website),
                      onTap: () => _goToShowInfo(context, accountsList[index]),
                    ),
                  ),
                );
              }
              if (snapshot.hasError || snapshot == null) {
                mainBuild = Text('Something Wrong Happened!');
              }
              return mainBuild;
            }),
      ),
    );
  }

  void _goToAddNewInfo(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => InsertNew()));
  }

  void _goToShowInfo(context, data) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ShowDataInfo(data)));
  }

  @override
  void dispose() {
    setState(() {});
    super.dispose();
  }
}
