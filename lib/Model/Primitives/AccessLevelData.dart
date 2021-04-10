class JAccessLevelData {
  String mode;
  String given;
  String want;
  bool isJoin = false;
  bool isRead = false;
  bool isWrite = false;
  bool isGetNotified = false;
  bool isApprove = false;
  bool isDelete = false;
  bool isShare = false;
  bool isOwner = false;

  void DecodeFromMap(Map<String, dynamic> acsInfo) {
    mode = acsInfo['mode'];
    given = acsInfo['given'];
    if (given != null) {
      for (int i = 0; i < given.length; i++) {
        switch (given[i]) {
          case 'J':
            isJoin = true;
            break;
          case 'R':
            isRead = true;
            break;
          case 'W':
            isWrite = true;
            break;
          case 'P':
            isGetNotified = true;
            break;
          case 'A':
            isApprove = true;
            break;
          case 'D':
            isDelete = true;
            break;
          case 'S':
            isShare = true;
            break;
          case 'O':
            isOwner = true;
            break;
        }
      }
    }
    want = acsInfo['want'];
  }
}
