import 'package:hampayam_chat/Model/Primitives/PubContent.dart';
import 'package:hampayam_chat/Model/Primitives/PubHead.dart';

class JRcvMsg {
  // data prop
  String topic;
  String from;
  JPubHead head = new JPubHead();
  String ts;
  int seq;
  dynamic content;
  bool hasRead = false;
  // controll prop
  bool hasHead;
  bool hasContent;
  bool readFile = false;
  bool isFile = false;
  JRcvMsg() {
    hasContent = false;
    hasHead = false;
    readFile = false;
  }

  void DecodeFromMap(dynamic data) {
    topic = data['topic'];
    from = data['from'];

    if (data['head'] != null) {
      hasHead = true;
      head = JPubHead();
      head.DecodeFromMap(data['head']);

      // if there is head, content is drafty
      if (data['content'] != null) {
        hasContent = true;
        content = JPubContent();
        content.DecodeFromMap(data['content']);
      }
    } else {
      content = data['content'];
    }

    ts = data['ts'];
    seq = data['seq'];
  }

  JPubHead GetMsgHead() {
    return head;
  }

  JPubContent GetPubContent() {
    return content;
  }

  JPubContent SetPubContent(content) {
    hasContent = true;
    content = JPubContent();
    this.content = content;
  }
}
