import 'package:json_annotation/json_annotation.dart';
part 'PubHeadPriority.g.dart';

@JsonSerializable()
class JPubHeadPriority {
  @JsonKey(name: "level", includeIfNull: false)
  String level;
  @JsonKey(name: 'expires', includeIfNull: false)
  String expires;
  JPubHeadPriority({this.level, this.expires});
  Map<String, dynamic> toJson() => _$JPubHeadPriorityToJson(this);

  factory JPubHeadPriority.fromJson(Map<String, dynamic> json) => _$JPubHeadPriorityFromJson(json);
}
