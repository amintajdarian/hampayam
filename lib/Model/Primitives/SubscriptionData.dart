import 'AccessLevelData.dart';
import 'LastMessage.dart';
import 'PrivateData.dart';
import 'PublicData.dart';
import 'SubSeen.dart';

class JSubscriptionData {
  // data props
  String user;
  DateTime updated;
  DateTime touched;
  JAccessLevelData _acs;
  int read;
  int recv;
  int clear;
  JPublicData _public;
  JPrivateData _private;
  bool online;
  String topic;
  int seq;
  JSubSeen _seen;
  LastMessage lastMessage;

  // controll peops
  bool hasAcs = false;
  bool hasPublic = false;
  bool hasPrivate = false;
  bool hasSeen = false;

  JSubscriptionData() {
    hasAcs = false;
    hasPrivate = false;
    hasPublic = false;
    hasSeen = false;
  }

  void DecodeFromMap(Map<String, dynamic> subInfo) {
    user = subInfo['user'];

    if (subInfo['updated'] != null) {
      updated = DateTime.parse(subInfo['updated']);
    }

    if (subInfo['touched'] != null) {
      touched = DateTime.parse(subInfo['touched']);
    }

    if (subInfo['acs'] != null) {
      hasAcs = true;
      _acs = JAccessLevelData();
      _acs.DecodeFromMap(subInfo['acs']);
    }

    if (subInfo['lastmsg'] != null) {
      lastMessage = LastMessage();
      lastMessage.DecodeFromDynamic(subInfo['lastmsg']);
    }

    read = subInfo['read'];
    recv = subInfo['recv'];
    clear = subInfo['clear'];

    if (subInfo['public'] != null) {
      hasPublic = true;
      _public = JPublicData.fromJson(subInfo['public']);
    }

    if (subInfo['private'] != null) {
      hasPrivate = true;
      _private = JPrivateData();
      //  _private.DecodeFromMap(subInfo['private']);
    }

    online = subInfo['online'];
    topic = subInfo['topic'];
    seq = subInfo['seq'];

    if (subInfo['seen'] != null) {
      hasSeen = true;
      _seen = JSubSeen();
      _seen.DecodeFromMap(subInfo['seen']);
    }
  }

  JAccessLevelData GetAccessLevelData() {
    return _acs;
  }

  JPublicData GetPublicData() {
    return _public;
  }

  JPublicData SetPublicData(JPublicData publicData) {
    this._public = publicData;
  }

  JPrivateData GetPrivateData() {
    return _private;
  }
}
