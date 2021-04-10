import 'package:hampayam_chat/Model/Primitives/PubContent.dart';
import 'package:hampayam_chat/Model/Primitives/PubHead.dart';

class JSndPub {
  String id;
  String topic;
  bool noecho;
  JPubHead _head;
  JPubContent _content;
  String content;

  // controll prop
  bool hasHead;
  bool hasContent;

  JRcvMsg() {
    hasContent = false;
    hasHead = false;
  }

  void DecodeFromMap(dynamic data) {
    id = data['id'];
    topic = data['topic'];
    noecho = data['noecho'];

    if (data['head'] != null) {
      hasHead = true;
      _head = JPubHead();
      _head.DecodeFromMap(data['head']);

      if (data['content'] != null) {
        hasContent = true;
        _content = JPubContent();
        _content.DecodeFromMap(data['content']);
      }
    } else {
      content = data['content'];
    }
  }

  Map<String, dynamic> EncodeToMap() {
    //
  }

  JPubHead GetMsgHead() {
    return _head;
  }

  void SetPubHead(JPubHead head) {
    _head = head;
  }

  /* JPubContent GetPubContent() {
    return _content;
  } */
}
