import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class P2pProvider extends ChangeNotifier {
  JSubscriptionData dataSub = JSubscriptionData();
  JAccessLevelData dataAcs = JAccessLevelData();
  List<JRcvMsg> chatList = [];
  int lastSeq = 0;
  JSubscriptionData get getDataSub => dataSub;
  JAccessLevelData get getDataAcs => dataAcs;
  List<JRcvMsg> get getchatList => chatList;
  int get getLastSeq => lastSeq;

  addSub(JSubscriptionData data) {
    this.dataSub = data;
    notifyListeners();
  }

  addAcs(JAccessLevelData data) {
    this.dataAcs = data;
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
