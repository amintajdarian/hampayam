import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Permissons {
  String permisson;

  bool isJoin = false;
  bool isRead = false;
  bool isWrite = false;
  bool isGetNotified = false;
  bool isApprove = false;
  bool isDelete = false;
  bool isShare = false;
  bool isOwner = false;
  bool isNull = false;
  Permissons({this.isJoin, this.isRead, this.isWrite, this.isGetNotified, this.isApprove, this.isDelete, this.isShare, this.isOwner, this.isNull, this.permisson});

  Permissons.fromJson(String type) {
    permisson = type;
  }
  String permissonEncode() {
    String newPer = '';
    if (isJoin) newPer += 'J';
    if (isRead) newPer += 'R';
    if (isWrite) newPer += 'W';
    if (isGetNotified) newPer += 'P';
    if (isApprove) newPer += 'A';
    if (isDelete) newPer += 'D';
    if (isShare) newPer += 'S';
    if (isOwner) newPer += 'O';
    if (isNull) newPer = 'N';
    return newPer;
  }

  void setJoin(bool permission) {
    isJoin = true;
  }

  void setRead(bool permission) {
    isRead = true;
  }

  void setWrite(bool permission) {
    isWrite = true;
  }

  void setGetNotified(bool permission) {
    isGetNotified = true;
  }

  void setApprove(bool permission) {
    isApprove = permission;
  }

  void setDelete(bool permission) {
    isDelete = permission;
  }

  void setShare(bool permission) {
    isShare = permission;
  }

  void setowner(bool permission) {
    isOwner = permission;
  }

  void setNull(bool permission) {
    isNull = permission;
  }

  void permissondncode(String perString) {
    for (int i = 0; i < perString.length; i++) {
      switch (perString[i]) {
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
        case 'N':
          isNull = true;
          break;
      }
    }
  }

  void permissonCange() {
    this.permisson = permissonEncode();
  }

  void permissonCangeWithStrl(String newPer) {
    this.permisson = newPer;
  }
}
