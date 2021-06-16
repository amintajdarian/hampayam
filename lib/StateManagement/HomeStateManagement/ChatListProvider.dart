import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:rxdart/rxdart.dart';

class ChatListProvider extends ChangeNotifier {
  List<JSubscriptionData> subList = [];
  List<JSubscriptionData> blockList = [];
  List<JSubscriptionData> userList = [];
  List<JSubscriptionData> groupList = [];
  List<JSubscriptionData> channelList = [];
  List<JSubscriptionData> botList = [];

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

  void changUnreadMessage(int seq, String topic) {
    for (var item in subList) {
      if (item.topic == topic) {
        item.seq = seq;
      }
    }
    if (topic.startsWith('usr')) {
      for (var item in userList) {
        if (item.topic == topic) {
          item.seq = seq;
        }
      }
    }
    if (topic.startsWith('grp')) {
      for (var item in groupList) {
        if (item.topic == topic) {
          item.seq = seq;
        }
      }
    }
    if (topic.startsWith('chl')) {
      for (var item in channelList) {
        if (item.topic == topic) {
          item.seq = seq;
        }
      }
    }
    if (topic.startsWith('bot')) {
      for (var item in botList) {
        if (item.topic == topic) {
          item.seq = seq;
        }
      }
    }
    notifyListeners();
  }

  void changreadMessage(int seq, String topic) {
    for (var item in subList) {
      if (item.topic == topic) {
        item.read = seq;
      }
    }
    if (topic.startsWith('usr')) {
      for (var item in userList) {
        if (item.topic == topic) {
          item.read = seq;
        }
      }
    }
    if (topic.startsWith('grp')) {
      for (var item in groupList) {
        if (item.topic == topic) {
          item.read = seq;
        }
      }
    }
    if (topic.startsWith('chl')) {
      for (var item in channelList) {
        if (item.topic == topic) {
          item.read = seq;
        }
      }
    }
    if (topic.startsWith('bot')) {
      for (var item in botList) {
        if (item.topic == topic) {
          item.read = seq;
        }
      }
    }
    notifyListeners();
  }

  void changLastMessage(String message, String fn, String topic) {
    for (var item in subList) {
      if (item.topic == topic) {
        item.lastMessage.message = message;
        item.lastMessage.fn = fn;
      }
    }
    if (topic.startsWith('usr')) {
      for (var item in userList) {
        if (item.topic == topic) {
          item.lastMessage.message = message;
          item.lastMessage.fn = fn;
        }
      }
    }
    if (topic.startsWith('grp')) {
      for (var item in groupList) {
        if (item.topic == topic) {
          item.lastMessage.message = message;
          item.lastMessage.fn = fn;
        }
      }
    }
    if (topic.startsWith('chl')) {
      for (var item in channelList) {
        if (item.topic == topic) {
          item.lastMessage.message = message;
          item.lastMessage.fn = fn;
        }
      }
    }
    if (topic.startsWith('bot')) {
      for (var item in botList) {
        if (item.topic == topic) {
          item.lastMessage.message = message;
          item.lastMessage.fn = fn;
        }
      }
    }
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
    groupList.toSet().toList();

    notifyListeners();
  }

  void clearData() {
    userList.clear();
    botList.clear();
    groupList.clear();
    subList.clear();
    channelList.clear();
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
