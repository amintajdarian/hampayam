import 'package:flutter/cupertino.dart';

class StatusUserProvider extends ChangeNotifier {
  List<String> onlineUser = [];
  List<String> get getOnlineUser => onlineUser;

  void addOnlineUser(String user) {
    if (!onlineUser.contains(user)) {
      onlineUser.add(user);
      notifyListeners();
    }
  }

  void deleteOnlineUser(String user) {
    if (onlineUser.contains(user)) {
      onlineUser.remove(user);
      notifyListeners();
    }
  }
}
