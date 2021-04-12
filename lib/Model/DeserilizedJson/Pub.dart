import 'package:hampayam_chat/Model/Primitives/PubHead.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Pub.g.dart';

@JsonSerializable()
class JSndPub {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'noecho', includeIfNull: false, defaultValue: false)
  bool noecho;
  @JsonKey(name: 'head', includeIfNull: false)
  JPubHead head;
  @JsonKey(name: 'content', includeIfNull: false)
  dynamic content;

  JSndPub({this.id, this.topic, this.noecho, this.head, this.content});
  Map<String, dynamic> toJson() => _$JSndPubToJson(this);

  factory JSndPub.fromJson(Map<String, dynamic> json) => _$JSndPubFromJson(json);
}
