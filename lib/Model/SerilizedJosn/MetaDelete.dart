import 'package:hampayam_chat/Model/Primitives/DelRange.dart';

class JMetaDelete {
  // data props

  int clear;
  List<JDelRange> _delseq;

  // controll props
  int delSeqLength;
  bool hasDelSeq;

  JDelRange GetDelRange(int index) {
    try {
      return _delseq.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
