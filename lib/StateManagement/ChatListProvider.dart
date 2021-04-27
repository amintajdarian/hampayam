import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ChatList extends ChangeNotifier {
  List<JSubscriptionData> subList = List();
  List<JSubscriptionData> blockList = List();

  List get setSubList => subList;
  List get setBlocklIST => blockList;
  void listSpliter(List<JSubscriptionData> dataSub) {
    subList = (dataSub);
    notifyListeners();
  }
}
