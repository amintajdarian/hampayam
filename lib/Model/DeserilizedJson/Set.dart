import 'dart:convert';

import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/Subscription.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Set.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndSet {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic')
  String topic;
  @JsonKey(name: 'desc', includeIfNull: false)
  Description desc;
  @JsonKey(name: 'sub', includeIfNull: false)
  Subscription sub;
  @JsonKey(name: 'tags', includeIfNull: false)
  List<String> tags;
  @JsonKey(name: 'cred', includeIfNull: false)
  JUserCredential cred;
  JSndSet({this.id, this.topic, this.desc, this.sub, this.tags, this.cred});
  factory JSndSet.fromJson(Map<String, dynamic> json) => _$JSndSetFromJson(json);
  Map<String, dynamic> toJson() => _$JSndSetToJson(this);
}
