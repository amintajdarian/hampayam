import 'dart:io';

import 'package:flutter/cupertino.dart';

class Profile extends ChangeNotifier {
  String fn;
  File photoFile;
  String userName;

  String get getFname => fn;
  File get getPhoto => photoFile;
  String get getUserName => userName;

  void fname(String fn) {
    this.fn = fn;
    notifyListeners();
  }

  void setPhoto(File photoFile) {
    this.photoFile = photoFile;
    notifyListeners();
  }

  void setUerName(String userName) {
    this.userName = userName;
    notifyListeners();
  }
}
