class AccountInfo {
  String _idCode;
  String _userName;
  String _password;
  String _website;

  AccountInfo();

  AccountInfo.online(
    this._idCode,
    this._userName,
    this._password,
    this._website,
  );

  String get idCode => _idCode;

  set idCode(String value) {
    if (value.isNotEmpty) _idCode = value;
  }

  String get userName => _userName;

  set userName(String value) {
    if (value.isNotEmpty) _userName = value;
  }

  String get password => _password;

  set password(String value) {
    if (value.isNotEmpty) _password = value;
  }

  String get website => _website;

  set website(String value) {
    if (value.isNotEmpty) _website = value;
  }
}
