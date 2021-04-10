import 'package:hampayam_chat/Model/Primitives/DelRange.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';

class JSndDelete {
  // data prop
  String id;
  String topic;
  String what;
  bool hard;
  List<Map<String, dynamic>> _delseq;
  String user;
  Map<String, dynamic> _cred;

  Map<String, dynamic> EncodeToMap() {
    var res = <String, dynamic>{};

    if (id != null) res['id'] = id;
    if (topic != null) res['topic'] = topic;
    if (what != null) res['what'] = what;
    if (hard != null) res['hard'] = hard;
    if (_delseq != null) res['delseq'] = _delseq;
    if (user != null) res['user'] = user;
    if (_cred != null) res['cred'] = _cred;

    return res;
  }

  void AddDelRange(JDelRange value) {
    try {
      //_delseq.add(value.EncodeToMap());
    } on NoSuchMethodError {
      _delseq = <Map<String, dynamic>>[];
      //_delseq.add(value.EncodeToMap());
    }
  }

  void SetCredential(JUserCredential cred) {
    //_cred = cred.EncodeToMap();
  }
}
