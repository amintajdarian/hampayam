import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class CreateChannelProvider extends ChangeNotifier {
  String imageFile;
  String nameChannel;
  bool textEmpty = false;
  bool created = false;
  JSubscriptionData dataCreated = JSubscriptionData();

  String get getImage => imageFile;
  bool get getTextEmpty => textEmpty;
  String get getNameChannel => nameChannel;
  bool get getCreated => created;
  JSubscriptionData get getDataCreated => dataCreated;

  setImageFile(String image) {
    this.imageFile = image;
    notifyListeners();
  }

  setChlName(String name) {
    this.nameChannel = name;
    notifyListeners();
  }

  setCreated(bool create) {
    this.created = create;
    notifyListeners();
  }

  addPublic(JPublicData data) {
    this.dataCreated.public = data;
    notifyListeners();
  }

  addAcs(JAccessLevelData accessLevelData) {
    this.dataCreated.acs = accessLevelData;
    notifyListeners();
  }

  addtopic(String topic) {
    this.dataCreated.topic = topic;
    notifyListeners();
  }

  addTimeUpdate(DateTime time) {
    this.dataCreated.updated = time;
    notifyListeners();
  }

  addtimeTouch(DateTime time) {
    this.dataCreated.touched = time;
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

  clear() {
    textEmpty = false;
    created = false;
    imageFile = null;
    dataCreated = new JSubscriptionData();
    notifyListeners();
  }
}
