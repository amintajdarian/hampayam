import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class CreateGrpProvider extends ChangeNotifier {
  List<bool> valueCheck = [];
  List<JSubscriptionData> dataAdded = [];
  bool floatingBtn = false;
  String imageFile;

  List<bool> get getValue => valueCheck;
  bool get getfloatingBtn => floatingBtn;
  List<JSubscriptionData> get getdataAdded => dataAdded;
  String get getImage => imageFile;
  setListCheck(int length) {
    this.valueCheck = List.filled(length, false);
    notifyListeners();
  }

  changeValue(bool value, int index) {
    this.valueCheck[index] = value;
    notifyListeners();
  }

  void setDataAdded(List<JSubscriptionData> data) {
    int counter = 0;
    for (int i = 0; i < valueCheck.length; i++) {
      if (valueCheck[i]) {
        if (!dataAdded.contains(data[i])) dataAdded.add(data[i]);
      } else if (!valueCheck[i]) {
        if (dataAdded.contains(data[i])) {
          dataAdded.remove(data[i]);
        }
        counter++;
      }
    }
    if (counter == valueCheck.length) dataAdded.clear();
    notifyListeners();
  }

  floatingBtnEnable() {
    int i = 0;
    if (valueCheck.length > 0) {
      for (var item in valueCheck) {
        if (item) {
          i++;
        }
      }
      if (i == 0) {
        floatingBtn = false;
      } else {
        floatingBtn = true;
      }
      notifyListeners();
    }
  }

  setImageFile(String image) {
    this.imageFile = image;
    notifyListeners();
  }
}
