import 'package:json_annotation/json_annotation.dart';

part 'DefAccessLevelData.g.dart';

@JsonSerializable()
class JDefAccessLevelData {
  @JsonKey(name: 'auth', includeIfNull: false)
  String auth;
  @JsonKey(name: 'anon', includeIfNull: false)
  String anon;
  JDefAccessLevelData(this.auth, this.anon);
  factory JDefAccessLevelData.fromJson(Map<String, dynamic> json) => _$JDefAccessLevelDataFromJson(json);
  Map<String, dynamic> toJson() => _$JDefAccessLevelDataToJson(this);
}
