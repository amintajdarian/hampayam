import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageSelectorProvider extends ChangeNotifier {
  List<bool> imagesSelect = [];
  File fileSended;
  bool floatBtnEn = false;
  int downloadProgress = 0;
  int recievedProgress = 1;

  List<bool> get getImagesSelect => imagesSelect;
  bool get getFloatBtnEn => floatBtnEn;
  File get getFileSended => fileSended;
  int get getDownloadProgress => downloadProgress;
  int get getRecievedProgress => recievedProgress;

  setLength(int itemLength) {
    this.imagesSelect = List.filled(itemLength, false);
    notifyListeners();
  }

  setSendedFile(File file) {
    this.fileSended.delete();
    this.fileSended = file;
  }

  setDownloadedCounter(int counter) {
    this.downloadProgress = counter;
    notifyListeners();
  }

  setRecievedCounter(int counter) {
    this.recievedProgress = counter;
    notifyListeners();
  }

  checkEn(bool en, int itemCheck) {
    this.imagesSelect.fillRange(0, imagesSelect.length, false);
    this.imagesSelect[itemCheck] = en;
    notifyListeners();
  }

  checkEnBtn() {
    int counter = 0;
    for (var item in this.getImagesSelect) {
      if (item) {
        counter++;
      }
    }
    if (counter >= 1) {
      this.floatBtnEn = true;
    } else {
      this.floatBtnEn = false;
    }
    notifyListeners();
  }

  clearData() {
    this.floatBtnEn = false;
    this.imagesSelect.fillRange(0, imagesSelect.length, false);
  }
}
