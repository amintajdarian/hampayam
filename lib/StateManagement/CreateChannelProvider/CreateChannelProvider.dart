import 'package:flutter/cupertino.dart';

class CreateChannelProvider extends ChangeNotifier {
  String imageFile;
  String get getImage => imageFile;
  setImageFile(String image) {
    this.imageFile = image;
    notifyListeners();
  }

  clear() {
    imageFile = '';
    notifyListeners();
  }
}
