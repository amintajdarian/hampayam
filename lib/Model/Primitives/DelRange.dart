class JDelRange {
  int low;
  int hi;

  void DecodeFromMap(Map<String, dynamic> delrangeInfo) {
    low = delrangeInfo['low'];
    hi = delrangeInfo['hi'];
  }
}
