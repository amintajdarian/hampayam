import 'TextEntity.dart';
import 'TextFormat.dart';

class JPubContent {
  // data prop
  String text;
  List<JTextFormat> fmt = new List();
  List<JTextEntity> ent = new List();

  // controll prop
  bool hasFmt;
  int fmtListLength;
  bool hasEnt;
  int entListLength;

  void DecodeFromMap(pubContent) {
    text = pubContent['text'];

    if (pubContent['fmt'] != null) {
      hasFmt = true;
      // get fmt info from pubContent
      List<dynamic> fmtInfo = pubContent['fmt'];
      fmtListLength = fmtInfo.length;

      // init fmt list
      fmt = List<JTextFormat>(fmtListLength);
      for (var i = 0; i < fmtListLength; i++) {
        // init fmt
        fmt[i] = JTextFormat();
        // mount fmt
        fmt[i].DecodeFromMap(fmtInfo[i]);
      }
    }

    if (pubContent['ent'] != null) {
      hasEnt = true;
      // get ent info from pubContent
      List<dynamic> entInfo = pubContent['ent'];
      entListLength = entInfo.length;

      // init ent list
      ent = List<JTextEntity>(entListLength);
      for (var i = 0; i < entListLength; i++) {
        // init ent
        ent[i] = JTextEntity();
        // mount ent
        ent[i].DecodeFromMap(entInfo[i]);
      }
    }
  }

  JTextFormat GetTextFormat(int index) {
    try {
      return fmt.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JTextEntity GetTextEntity(int index) {
    try {
      return ent.elementAt(index);
    } catch (e) {}
  }
}
