import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/DescriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ChlProvider extends ChangeNotifier {
  JSubscriptionData topicData = JSubscriptionData();
  List<JSubscriptionData> dataSub = [];
  List<JRcvMsg> chatList = [];
  bool showButtonBar = true;
  JDescriptionData dataDesc = JDescriptionData();
  JSubscriptionData get getTopicData => topicData;
  JDescriptionData get getDataDesc => dataDesc;
  bool get getShowButton => showButtonBar;
  List<JSubscriptionData> get getDataSub => dataSub;
  List<JRcvMsg> get getchatList => chatList;

  addSub(List<JSubscriptionData> data) {
    this.dataSub = data;
    notifyListeners();
  }

  addMemberSub(JSubscriptionData data) {
    this.dataSub.add(data);
    notifyListeners();
  }

  addTopicDesc(JDescriptionData data) {
    if (data.hasDefAcs() != null) this.dataDesc = data;
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

  inserstMsg(JRcvMsg msg) {
    chatList.insert(0, msg);
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
