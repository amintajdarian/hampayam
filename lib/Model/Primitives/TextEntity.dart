import 'TextEntityData.dart';

class JTextEntity {
  // data prop
  String tp;
  JTextEntityData data;

  // cobtroll prop
  bool hasData;

  JTextEntity() {
    hasData = false;
  }

  void DecodeFromMap(entInfo) {
    tp = entInfo['tp'];

    if (entInfo['data'] != null) {
      hasData = true;
      data = JTextEntityData();
      data.DecodeFromMap(entInfo['data']);
    }
  }

  JTextEntityData GetTextEntityData() {
    return data;
  }

  void setTextEntityData(JTextEntityData data) {
    this.data = data;
  }
}
