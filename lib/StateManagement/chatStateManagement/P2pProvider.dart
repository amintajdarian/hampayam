import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class P2pProvider extends ChangeNotifier {
  JSubscriptionData dataSub = JSubscriptionData();
  List<JRcvMsg> chatList = [];
  JSubscriptionData get getDataSub => dataSub;
  List<JRcvMsg> get getchatList => chatList;

  addSub(JSubscriptionData data) {
    this.dataSub = data;
    notifyListeners();
  }

  addMsg(JRcvMsg msg) {
    if (chatList.length > 1) {
      if (chatList.first.seq != msg.seq) {
        chatList.add(msg);
      }
    } else {
      chatList.add(msg);
    }
    chatList.sort((a, b) => b.seq.compareTo(a.seq));
    notifyListeners();
  }

  leaveSub() {
    this.dataSub = JSubscriptionData();
    this.chatList.clear();
  }
}
