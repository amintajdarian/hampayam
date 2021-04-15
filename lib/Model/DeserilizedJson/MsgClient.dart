import 'dart:convert';

import 'package:hampayam_chat/Model/DeserilizedJson/Account.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Hi.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Leave.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Login.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Pub.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/SendDel.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/SendSub.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Set.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Note.dart';
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
  factory MsgClient.fromJson(Map<String, dynamic> json) => _$MsgClientFromJson(json);
}
