import 'dart:convert';

import 'package:hampayam_chat/Model/Primitives/DelRange.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SendDel.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndDel {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic', includeIfNull: false)
  String topic;
  @JsonKey(name: 'what', includeIfNull: false)
  String what;
  @JsonKey(name: 'hard', includeIfNull: false, defaultValue: false)
  bool hard;
  @JsonKey(name: 'delseq', includeIfNull: false)
  List<JDelRange> delSeq;
  @JsonKey(name: 'user', includeIfNull: false)
  String user;
  @JsonKey(name: 'cred', includeIfNull: false)
  JUserCredential cred;
  JSndDel({this.id, this.topic, this.what, this.hard, this.delSeq, this.user, this.cred});
  Map<String, dynamic> toJson() => _$JSndDelToJson(this);

  factory JSndDel.fromJson(Map<String, dynamic> json) => _$JSndDelFromJson(json);
}
