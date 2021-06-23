import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class GrpProvider extends ChangeNotifier {
  JSubscriptionData topicData = JSubscriptionData();
  List<JSubscriptionData> dataSub = [];
  List<JRcvMsg> chatList = [];
  bool showButtonBar = true;

  JSubscriptionData get getTopicData => topicData;
  bool get getShowButton => showButtonBar;
  List<JSubscriptionData> get getDataSub => dataSub;
  List<JRcvMsg> get getchatList => chatList;

  addSub(List<JSubscriptionData> data) {
    this.dataSub = data;
    notifyListeners();
  }

  addTopicSub(JSubscriptionData data) {
    if (data.public != null) this.topicData = data;
    notifyListeners();
  }

  changeShowButton(bool status) {
    this.showButtonBar = status;
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
    topicData = new JSubscriptionData();
    this.dataSub.clear();
    this.chatList.clear();
    this.showButtonBar = true;
    notifyListeners();
  }
}
