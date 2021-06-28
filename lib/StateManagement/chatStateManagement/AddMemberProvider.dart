import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class AddMemberProvider extends ChangeNotifier {
  List<bool> valueCheck = [];

  List<JSubscriptionData> dataAdded = [];
  List<JSubscriptionData> member = [];
  String topic;
  bool floatingBtn = false;

  List<bool> get getValue => valueCheck;
  bool get getfloatingBtn => floatingBtn;
  List<JSubscriptionData> get getdataAdded => dataAdded;
  List<JSubscriptionData> get getMember => member;
  String get getTopicData => topic;

  setListCheck(int length) {
    this.valueCheck = List.filled(length, false);
    notifyListeners();
  }

  changeValue(bool value, int index) {
    this.valueCheck[index] = value;
    notifyListeners();
  }

  addMember(List<JSubscriptionData> member) {
    this.member = member;
    notifyListeners();
  }

  void setDataAdded(List<JSubscriptionData> data) {
    for (int i = 0; i < valueCheck.length; i++) {
      if (valueCheck[i]) {
        if (!dataAdded.contains(data[i])) {
          dataAdded.add(data[i]);
        }
      } else if (!valueCheck[i]) {
        if (dataAdded.contains(data[i])) {
          dataAdded.remove(data[i]);
        }
      }
    }

    notifyListeners();
  }

  floatingBtnEnable() {
    if (dataAdded.length <= 0) {
      floatingBtn = false;
    } else {
      floatingBtn = true;
    }
    notifyListeners();
  }

  addAcs(String user, JAccessLevelData accessLevelData) {
    for (var item in dataAdded) {
      if (item.user == user) {
        item.acs = accessLevelData;
      }
    }
    notifyListeners();
  }

  clearData() {
    valueCheck = List.filled(valueCheck.length, false);
    dataAdded.clear();
    floatingBtn = false;
    topic = null;

    notifyListeners();
  }
}
