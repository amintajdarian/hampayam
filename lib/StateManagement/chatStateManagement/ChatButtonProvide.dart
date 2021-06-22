import 'package:flutter/cupertino.dart';

class ChatButtonProvider extends ChangeNotifier {
  bool buttonEnable = false;
  bool get getButtonEn => buttonEnable;

  changeTextEnable(bool en) {
    this.buttonEnable = en;
    notifyListeners();
  }
}
