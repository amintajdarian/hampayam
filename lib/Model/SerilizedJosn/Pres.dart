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

  void DecodeFromMap(dynamic pres) {
    topic = pres['topic'];
    src = pres['src'];
    what = pres['what'];
    seq = pres['seq'];
    clear = pres['clear'];
    ua = pres['ua'];
    act = pres['act'];

    if (pres['acs'] != null) {
      hasAcs = true;
      _acs = JAccessLevelData();
      _acs.DecodeFromMap(pres['acs']);
    }
    if (pres['act'] != null) {
      hasAct = true;

      act = pres['acs'];
    }
    if (pres['act'] != null) {
      hastgt = true;

      tgt = pres['acs'];
    }
    if (pres['dacs'] != null) {
      hasDAcs = true;
      dacs = JAccessLevelData();
      dacs.DecodeFromMap(pres['dacs']);
    }
    if (pres['delseq'] != null) {
      hasDelRange = true;
      // get delseq info
      List<dynamic> delseqInfo = pres['delseq'];
      var delseqInfoLength = delseqInfo.length;

      // init delseq
      _delseq = List<JDelRange>(delseqInfoLength);

      // mount delseq
      for (var i = 0; i < delseqInfoLength; i++) {
        _delseq[i] = JDelRange();
        _delseq[i].DecodeFromMap(delseqInfo[i]);
      }
    }
    if (pres['extra'] != null) {
      jrcvExtra = JrcvExtra();
      jrcvExtra.DecodeFromDynamic(pres['extra']);
    }
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
