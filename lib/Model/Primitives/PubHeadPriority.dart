class JPubHeadPriority {
  String level;
  String expires;

  void DecodeFromMap(priorityData) {
    level = priorityData['level'];
    expires = priorityData['expires'];
  }
}
