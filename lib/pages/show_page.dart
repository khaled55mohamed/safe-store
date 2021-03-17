import 'package:flutter/material.dart';
import 'package:safe_store/modules/information.dart';

class ShowDataInfo extends StatelessWidget {
  final AccountInfo accountInfo;

  ShowDataInfo(this.accountInfo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Account info'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _textShowDesign(context, accountInfo.idCode),
            _textShowDesign(context, accountInfo.userName),
            _textShowDesign(context, accountInfo.password),
            _textShowDesign(context, accountInfo.website),
          ],
        ),
      ),
    );
  }

  _textShowDesign(context, textShow) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        padding: EdgeInsets.all(16),
        child: Text(
          textShow,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
