import 'package:hampayam_chat/Model/Primitives/DataWhat.dart';
import 'package:hampayam_chat/Model/Primitives/Delete.dart';
import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/Subscription.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Get.g.dart';

@JsonSerializable(explicitToJson: true)
class JSndGet {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic', includeIfNull: false)
  String topic;
  @JsonKey(name: 'what', includeIfNull: false)
  String what;
  @JsonKey(name: 'desc', includeIfNull: false)
  Description desc;
  @JsonKey(name: 'sub', includeIfNull: false)
  Subscription sub;
  @JsonKey(name: 'data', includeIfNull: false)
  DataWhat data;
  @JsonKey(name: 'del', includeIfNull: false)
  Delete del;
  JSndGet({this.id, this.topic, this.what, this.desc, this.sub, this.data, this.del});
  Map<String, dynamic> toJson() => _$JSndGetToJson(this);
  factory JSndGet.fromJson(Map<String, dynamic> json) => _$JSndGetFromJson(json);
}
