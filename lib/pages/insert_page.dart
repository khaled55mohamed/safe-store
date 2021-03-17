import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:safe_store/constants/insert_page.dart';
import 'package:safe_store/modules/information.dart';
import 'package:safe_store/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class InsertNew extends StatefulWidget {
  InsertNew({Key key}) : super(key: key);

  @override
  _InsertNewState createState() => _InsertNewState();
}

class _InsertNewState extends State<InsertNew> {
  AccountInfo _accountInfo = AccountInfo();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert New'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: Icon(
                Icons.save_rounded,
                color: Colors.white,
              ),
              onPressed: () => _saveAccountDataNow(context))
        ],
      ),
      body: ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          padding: EdgeInsets.only(top: 30.0),
          height: MediaQuery.of(context).size.height / 1.75,
          color: Colors.green[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _textFieldDesign(
                myController: _userNameController,
                myHintText: 'User Name',
              ),
              _textFieldDesign(
                myController: _passwordController,
                myHintText: 'Password',
              ),
              _textFieldDesign(
                myController: _websiteController,
                myHintText: 'Website',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // will save the collected data in firebase store
  _saveAccountDataNow(context) async {
    _accountInfo.idCode = randomAlphaNumeric(10);
    _accountInfo.userName = _userNameController.text;
    _accountInfo.password = _passwordController.text;
    _accountInfo.website = _websiteController.text;
    await DataBaseServices().updateAccountData(_accountInfo);
    Fluttertoast.showToast(
      msg: "Account Data Save Success!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green[400],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // will create a custom textfield for each controller
  _textFieldDesign({myController, myHintText}) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.green[400],
      ),
      child: TextField(
        controller: myController,
        keyboardType: TextInputType.text,
        style: editTextTextStyleData,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => myController.clear(),
          ),
          hintText: myHintText,
          hintStyle: editTextTextStyleHint,
        ),
      ),
    );
  }
}
