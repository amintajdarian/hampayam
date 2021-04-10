import 'PubContent.dart';

class LastMessage {
  // data prop
  String fn;
  String from;
  dynamic message;

  // controll prop
  bool isFmt;
  bool isEntity;

  LastMessage() {
    isFmt = false;
    isEntity = false;
  }

  void DecodeFromDynamic(dynamic info) {
    fn = info['fn'];

    from = info['from'];
    if (info['message'].runtimeType != String) {
      message = JPubContent();
      message.DecodeFromMap(info);
      isFmt = info['message']['fmt'] != null;
      isEntity = info['message']['ent'] != null;
    } else {
      message = info['message'];
    }
  }
}
