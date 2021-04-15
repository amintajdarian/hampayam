import 'package:json_annotation/json_annotation.dart';
part 'Leave.g.dart';

@JsonSerializable()
class JSndLeave {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'unsub', includeIfNull: false, defaultValue: true)
  bool unSub;
  JSndLeave({this.id, this.topic, this.unSub});
  Map<String, dynamic> toJson() => _$JSndLeaveToJson(this);

  factory JSndLeave.fromJson(Map<String, dynamic> json) => _$JSndLeaveFromJson(json);
}
