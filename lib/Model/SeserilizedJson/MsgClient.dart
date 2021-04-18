import 'package:json_annotation/json_annotation.dart';
import 'Account.dart';
import 'Get.dart';
import 'Hi.dart';
import 'Leave.dart';
import 'Login.dart';
import 'Note.dart';
import 'Pub.dart';
import 'SendDel.dart';
import 'SendSub.dart';
import 'Set.dart';
part 'MsgClient.g.dart';

@JsonSerializable(explicitToJson: true)
class MsgClient {
  @JsonKey(name: 'hi', includeIfNull: false)
  JSndHi jSndHi;
  @JsonKey(name: 'acc', includeIfNull: false)
  JSndAcc jSndAcc;
  @JsonKey(name: 'login', includeIfNull: false)
  JSndLogin jSndLogin;
  @JsonKey(name: 'sub', includeIfNull: false)
  JSndSub jSndSub;
  @JsonKey(name: 'leave', includeIfNull: false)
  JSndLeave jSndLeave;
  @JsonKey(name: 'pub', includeIfNull: false)
  JSndPub jSndPub;
  @JsonKey(name: 'get', includeIfNull: false)
  JSndGet jSndGet;
  @JsonKey(name: 'set', includeIfNull: false)
  JSndSet jSndSet;
  @JsonKey(name: 'del', includeIfNull: false)
  JSndDel jSndDel;
  @JsonKey(name: 'note', includeIfNull: false)
  JSndNote jSndNote;
  MsgClient({this.jSndHi, this.jSndAcc, this.jSndLogin, this.jSndSub, this.jSndLeave, this.jSndPub, this.jSndGet, this.jSndSet, this.jSndDel, this.jSndNote});
  Map<String, dynamic> toJson() => _$MsgClientToJson(this);
}
