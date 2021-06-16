import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  String fn;
  String sn;
  String photoFile;
  String userName;
  String phone;
  String token;

  String get getFname => fn;
  String get getSname => sn;
  String get getPhoto => photoFile;
  String get getUserName => userName;
  String get getPhone => phone;
  String get getToken => token;

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

  void setUerName(String userName) {
    this.userName = userName;
    notifyListeners();
  }

  void setToken(String token) {
    this.token = token;
    notifyListeners();
  }
}
