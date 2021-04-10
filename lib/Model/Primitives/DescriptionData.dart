import 'AccessLevelData.dart';
import 'DefAccessLevelData.dart';

import 'PrivateData.dart';
import 'PublicData.dart';

class JDescriptionData {
  // data props
  String created;
  String updated;
  String status;
  JDefAccessLevelData _defacs;
  JAccessLevelData _acs;
  int seq;
  int read;
  int recv;
  int clear;
  JPublicData _public;
  JPrivateData _private;

  // controll props
  bool hasDefAcs;
  bool hasAcs;
  bool hasPublic;
  bool hasPrivate;

  JDescriptionData() {
    hasAcs = false;
    hasDefAcs = false;
    hasPrivate = false;
    hasPublic = false;
  }

  void DecodeFromMap(Map<String, dynamic> desc) {
    created = desc['created'];
    updated = desc['updated'];
    status = desc['status'];

    if (desc['defacs'] != null) {
      _defacs = JDefAccessLevelData.fromJson(desc['defacs']);
    }

    if (desc['acs'] != null) {
      _acs = new JAccessLevelData();
      _acs.DecodeFromMap(desc['acs']);
    }

    seq = desc['seq'];
    read = desc['read'];
    recv = desc['recv'];
    clear = desc['clear'];

    if (desc['public'] != null) {
      _public = new JPublicData.fromJson(desc['public']);
    }

    if (desc['private'] != null) {
      _private = JPrivateData.fromJson(desc['private']);
    }
  }

  JDefAccessLevelData GetDefAcs() {
    return _defacs;
  }

  JAccessLevelData GetAcs() {
    return _acs;
  }

  JPublicData GetPublic() {
    return _public;
  }

  JPrivateData GetPrivate() {
    return _private;
  }
}
