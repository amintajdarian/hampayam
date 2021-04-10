class JTextFormat {
  // data prop
  int at;
  int len;
  String tp;
  int key;

  void DecodeFromMap(fmtInfo) {
    at = fmtInfo['at'];
    len = fmtInfo['len'];
    tp = fmtInfo['tp'];
    key = fmtInfo['key'];
  }
}
