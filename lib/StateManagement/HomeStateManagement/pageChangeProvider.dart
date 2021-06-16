import 'package:flutter/cupertino.dart';

class PageChangeProvider extends ChangeNotifier {
  int pageIndex = 0;
  bool enableAppbar = true;

  int get getPageIndex => pageIndex;
  bool get getEnableAppBAr => enableAppbar;
  void changeEnableAppBAr(bool change) {
    this.enableAppbar = change;
    notifyListeners();
  }

  void aaa() {
    notifyListeners();
  }

  void changePageIndex(int newPageIndex) {
    this.pageIndex = newPageIndex;
    notifyListeners();
  }
}
