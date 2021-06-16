import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ChatListProvider extends ChangeNotifier {
  List<JSubscriptionData> subList = List();
  List<JSubscriptionData> blockList = List();
  List<JSubscriptionData> userList = List();
  List<JSubscriptionData> groupList = List();
  List<JSubscriptionData> channelList = List();
  List<JSubscriptionData> botList = List();

  List<JSubscriptionData> get getSubList => subList;
  List<JSubscriptionData> get getBlockList => blockList;
  List<JSubscriptionData> get getGroupList => groupList;
  List<JSubscriptionData> get getChanelList => channelList;
  List<JSubscriptionData> get getUSerList => userList;
  void listSpliter(List<JSubscriptionData> dataSub) {
    subList = (dataSub);
    for (var item in dataSub) {
      if (item.topic.startsWith('usr')) {
        userList.add(item);
      } else if (item.topic.startsWith('grp')) {
        groupList.add(item);
      } else if (item.topic.startsWith('chl')) {
        channelList.add(item);
      } else if (item.topic.startsWith('bot')) {
        botList.add(item);
      }
    }
    notifyListeners();
  }

  void aaaa() {
    notifyListeners();
  }

  void changeNameItem(String name, String topic) {
    subList.elementAt(subList.indexWhere((element) => element.topic == topic)).topic = topic;
    if (topic.startsWith('usr')) {
      userList.elementAt(userList.indexWhere((element) => element.topic == topic)).topic = topic;
    } else if (topic.startsWith('grp')) {
      groupList.elementAt(groupList.indexWhere((element) => element.topic == topic)).topic = topic;
    } else if (topic.startsWith('chl')) {
      channelList.elementAt(channelList.indexWhere((element) => element.topic == topic)).topic = topic;
    } else if (topic.startsWith('bot')) {
      botList.elementAt(botList.indexWhere((element) => element.topic == topic)).topic = topic;
    }
    notifyListeners();
  }

  void deleteItem(String topic) {
    subList.removeWhere((element) => element.topic == topic);
    if (topic.startsWith('usr')) {
      userList.removeWhere((element) => element.topic == topic);
    } else if (topic.startsWith('grp')) {
      groupList..removeWhere((element) => element.topic == topic);
    } else if (topic.startsWith('chl')) {
      channelList.removeWhere((element) => element.topic == topic);
    } else if (topic.startsWith('bot')) {
      botList.removeWhere((element) => element.topic == topic);
    }
    notifyListeners();
  }
}
