import 'dart:convert';

import 'package:hampayam_chat/Model/DeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/DeserilizedJson/Hi.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Note.dart';
part 'MsgClient.g.dart';

@JsonSerializable(explicitToJson: true)
class MsgClient {
  @JsonKey(name: 'note', includeIfNull: false)
  JSndNote jSndNote;
  @JsonKey(name: 'get', includeIfNull: false)
  JSndGet jSndGet;
  @JsonKey(name: 'hi', includeIfNull: false)
  JSndHi jSndHi;
  MsgClient({this.jSndNote, this.jSndGet, this.jSndHi});
  Map<String, dynamic> toJson() => _$MsgClientToJson(this);
}
