import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class P2pProvider extends ChangeNotifier {
  JSubscriptionData dataSub = JSubscriptionData();
  List<JRcvMsg> chatList = [];
  int lastSeq = 0;
  JSubscriptionData get getDataSub => dataSub;
  List<JRcvMsg> get getchatList => chatList;
  int get getLastSeq => lastSeq;

  addSub(JSubscriptionData data) {
    this.dataSub = data;
    notifyListeners();
  }

  changeLastSeq(int seq) {
    this.lastSeq = seq;
    notifyListeners();
  }

  addMsg(JRcvMsg msg) {
    if (chatList.length > 1) {
      if (chatList.first.seq != msg.seq) {
        if (chatList.every((element) {
          return (element.seq != msg.seq);
        })) chatList.add(msg);
      }
    } else {
      chatList.add(msg);
    }

    chatList.sort((a, b) => b.seq.compareTo(a.seq));
    notifyListeners();
  }

  inserMsg(JRcvMsg msg) {
    chatList.insert(0, msg);

    notifyListeners();
  }

  leaveSub() {
    this.dataSub = JSubscriptionData();
    this.chatList.clear();
    notifyListeners();
  }
}
