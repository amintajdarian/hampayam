import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

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
    if (subList.length > 0) {
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
    }
    notifyListeners();
  }

  void addSubList(JSubscriptionData data) {
    if (data.topic.startsWith('usr')) {
      userList.insert(0, data);
    } else if (data.topic.startsWith('grp')) {
      groupList.insert(0, data);
    } else if (data.topic.startsWith('chl')) {
      channelList.insert(0, data);
    } else if (data.topic.startsWith('bot')) {
      botList.insert(0, data);
    }
    subList.insert(0, data);
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

  void chatListChange(String topic) {
    if (subList.length > 1) {
      for (var item in subList) {
        if (item.topic == topic) {
          int index = subList.indexOf(item);
          subList.insert(0, subList.removeAt(index));
        }
      }
    }
    if (userList.length > 1) {
      if (topic.startsWith('usr')) {
        for (var item in userList) {
          if (item.topic == topic) {
            int index = userList.indexOf(item);
            userList.insert(0, userList.removeAt(index));
          }
        }
      }
    }
    if (groupList.length > 1) {
      if (topic.startsWith('grp')) {
        for (var item in groupList) {
          if (item.topic == topic) {
            int index = groupList.indexOf(item);
            groupList.insert(0, groupList.removeAt(index));
          }
        }
      }
    }
    if (channelList.length > 1) {
      if (topic.startsWith('chl')) {
        for (var item in channelList) {
          if (item.topic == topic) {
            int index = channelList.indexOf(item);
            channelList.insert(0, channelList.removeAt(index));
          }
        }
      }
    }
    if (botList.length > 1) {
      if (topic.startsWith('bot')) {
        for (var item in botList) {
          if (item.topic == topic) {
            int index = botList.indexOf(item);
            botList.insert(0, botList.removeAt(index));
          }
        }
      }
    }
  }

  void changReadMessage(int seq, String topic) {
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
    subList
        .elementAt(subList.indexWhere((element) => element.topic == topic))
        .topic = topic;
    if (topic.startsWith('usr')) {
      userList
          .elementAt(userList.indexWhere((element) => element.topic == topic))
          .topic = topic;
    } else if (topic.startsWith('grp')) {
      groupList
          .elementAt(groupList.indexWhere((element) => element.topic == topic))
          .topic = topic;
    } else if (topic.startsWith('chl')) {
      channelList
          .elementAt(
              channelList.indexWhere((element) => element.topic == topic))
          .topic = topic;
    } else if (topic.startsWith('bot')) {
      botList
          .elementAt(botList.indexWhere((element) => element.topic == topic))
          .topic = topic;
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
