import 'package:hampayam_chat/Model/Primitives/AccessLevelData.dart';
import 'package:hampayam_chat/Model/Primitives/DelRange.dart';

class JRcvPres {
  // data props
  String topic;
  String src;
  String what;
  int seq;
  int clear;
  String ua;
  String act;
  String tgt;
  JAccessLevelData dacs;

  JAccessLevelData _acs;
  List<JDelRange> _delseq;
  JrcvExtra jrcvExtra;

  // control props
  bool hasAcs;
  bool hasDAcs;
  bool hasDelRange;
  bool hasAct;
  bool hastgt;

  JRcvPres() {
    hasAcs = false;
    hasDelRange = false;
    hasAct = false;
    hastgt = false;
  }

  JAccessLevelData GetPresAcs() {
    return _acs;
  }

  JAccessLevelData GetPresDAcs() {
    return dacs;
  }

  JDelRange GetDelRange(int index) {
    try {
      return _delseq.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}

class JrcvExtra {
  String fn;
  String message;
  void DecodeFromDynamic(dynamic extraInfo) {
    fn = extraInfo['fn'];
    message = extraInfo['message'];
  }
}
