import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_store/modules/information.dart';

class DataBaseServices {
  final CollectionReference accountsReference =
      FirebaseFirestore.instance.collection('AccountsData');

  Future updateAccountData(AccountInfo info) async {
    return await accountsReference.doc(info.idCode).set({
      'idCode': info.idCode,
      'userName': info.userName,
      'password': info.password,
      'website': info.website,
    });
  }
}
