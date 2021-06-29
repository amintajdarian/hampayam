import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class CreateGrpProvider extends ChangeNotifier {
  List<bool> valueCheck = [];
  List<JSubscriptionData> dataAdded = [];
  JSubscriptionData topicData = JSubscriptionData();
  bool floatingBtn = false;
  String imageFile;
  String nameGrp;
  bool textEmpty = false;
  bool created = false;

  List<bool> get getValue => valueCheck;
  bool get getfloatingBtn => floatingBtn;
  List<JSubscriptionData> get getdataAdded => dataAdded;
  String get getNameGrp => nameGrp;
  JSubscriptionData get getTopicData => topicData;

  String get getImage => imageFile;
  bool get getTextEmpty => textEmpty;
  bool get getCreated => created;

  setListCheck(int length) {
    this.valueCheck = List.filled(length, false);
    notifyListeners();
  }

  changeValue(bool value, int index) {
    this.valueCheck[index] = value;
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
    int i = 0;
    if (valueCheck.length > 0) {
      for (var item in valueCheck) {
        if (item) {
          i++;
        }
      }
      if (i == 0) {
        floatingBtn = false;
      } else {
        floatingBtn = true;
      }
      notifyListeners();
    }
  }

  setImageFile(String image) {
    this.imageFile = image;
    notifyListeners();
  }

  setGrpName(String name) {
    this.nameGrp = name;
    notifyListeners();
  }

  setCreated(bool create) {
    this.created = create;
    notifyListeners();
  }

  addPublic(JPublicData data) {
    this.topicData.public = data;
    notifyListeners();
  }

  addAcs(JAccessLevelData accessLevelData) {
    this.topicData.acs = accessLevelData;
    notifyListeners();
  }

  addtopic(String topic) {
    this.topicData.topic = topic;
    notifyListeners();
  }

  addTimeUpdate(DateTime time) {
    this.topicData.updated = time;
    notifyListeners();
  }

  addtimeTouch(DateTime time) {
    this.topicData.touched = time;
    notifyListeners();
  }

  emptyValidator(String controller) {
    if (controller != '') {
      this.textEmpty = false;
    } else {
      this.textEmpty = true;
    }
    notifyListeners();
  }

  addToicSub(JSubscriptionData topicData) {
    this.topicData = topicData;
    notifyListeners();
  }

  changeCreated(bool created) {
    this.created = created;
    notifyListeners();
  }

  clearData() {
    valueCheck = List.filled(valueCheck.length, false);
    dataAdded.clear();
    floatingBtn = false;
    imageFile = null;
    nameGrp = null;
    topicData = new JSubscriptionData();
    created = false;
    textEmpty = false;

    notifyListeners();
  }
}
