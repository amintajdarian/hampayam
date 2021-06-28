import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  String fn = '';
  String sn = '';
  String photoFile = '';
  String userName = '';
  String phone = '';
  String token = '';
  String resp = '';
  bool setSub = true;

  String get getFname => fn;
  String get getSname => sn;
  String get getPhoto => photoFile;
  String get getUserName => userName;
  String get getPhone => phone;
  String get getToken => token;
  String get getResp => resp;
  bool get getSetSub => setSub;

  void fname(String fn) {
    this.fn = fn;
    notifyListeners();
  }

  void sname(String sn) {
    this.sn = sn;
    notifyListeners();
  }

  void setPhoto(String photoFile) {
    this.photoFile = photoFile;
    notifyListeners();
  }

  void setPhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  void setResp(String resp) {
    this.resp = resp;
    notifyListeners();
  }

  void setUerName(String userName) {
    this.userName = userName;
    notifyListeners();
  }

  void setToken(String token) {
    if (token != null) this.token = token;
    notifyListeners();
  }

  void changeSetSub(bool subEn) {
    this.setSub = subEn;
    notifyListeners();
  }

  void reset() {
    fn = '';
    sn = '';
    photoFile = '';
    userName = '';
    phone = '';
    token = '';
    resp = '';
    setSub = true;
  }
}
