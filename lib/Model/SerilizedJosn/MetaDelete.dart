import 'package:hampayam_chat/Model/Primitives/DelRange.dart';

class JMetaDelete {
  // data props
  int clear;
  List<JDelRange> _delseq;

  // controll props
  int delSeqLength;
  bool hasDelSeq;

  JMetaDelete() {
    delSeqLength = 0;
    hasDelSeq = false;
  }

  void DecodeFromMap(Map<String, dynamic> del) {
    clear = del['clear'];

    if (del['delseq'] != null) {
      hasDelSeq = true;
      // get delseq info
      List<dynamic> delseqInfo = del['delseq'];
      var delseqInfoLength = delseqInfo.length;

      // init delseq
      _delseq = List<JDelRange>(delseqInfoLength);

      // mount delseq
      for (var i = 0; i < delseqInfoLength; i++) {
        _delseq[i] = JDelRange();
        _delseq[i].DecodeFromMap(delseqInfo[i]);
      }
    }
  }

  JDelRange GetDelRange(int index) {
    try {
      return _delseq.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
