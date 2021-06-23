import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ChlProvider extends ChangeNotifier {
  JSubscriptionData topicData = JSubscriptionData();
  List<JSubscriptionData> dataSub = [];
  List<JRcvMsg> chatList = [];

  JSubscriptionData get getTopicData => topicData;
  List<JSubscriptionData> get getDataSub => dataSub;
  List<JRcvMsg> get getchatList => chatList;

  addSub(List<JSubscriptionData> data) {
    this.dataSub = data;
    notifyListeners();
  }

  addTopicSub(JSubscriptionData data) {
    this.topicData = data;
    notifyListeners();
  }

  addMsg(JRcvMsg msg) {
    chatList.sort((a, b) => b.seq.compareTo(a.seq));
    if (chatList.length > 1) {
      if (chatList.first.seq != msg.seq) {
        chatList.add(msg);
      }
    } else {
      chatList.add(msg);
    }

    notifyListeners();
  }

  leaveSub() {
    this.dataSub.clear();
    this.chatList.clear();
    notifyListeners();
  }
}
