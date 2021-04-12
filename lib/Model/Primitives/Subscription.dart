import 'package:json_annotation/json_annotation.dart';

part 'Subscription.g.dart';

@JsonSerializable()
class Subscription {
  @JsonKey(name: "ims", includeIfNull: false)
  DateTime ims;
  @JsonKey(name: "user", includeIfNull: false)
  String user;
  @JsonKey(name: "topic", includeIfNull: false)
  String topic;
  @JsonKey(name: "limit", includeIfNull: false)
  String limit;
  @JsonKey(name: "mode", includeIfNull: false)
  String mode;
  Subscription({this.ims, this.user, this.topic, this.mode, this.limit});
  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
