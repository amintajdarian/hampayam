import 'package:hampayam_chat/Model/Primitives/Permisson.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AccessLevelData.g.dart';

@JsonSerializable(explicitToJson: true)
class JAccessLevelData {
  @JsonKey(name: 'mode', includeIfNull: false)
  Permissons mode;
  @JsonKey(name: 'given', includeIfNull: false)
  Permissons given;
  @JsonKey(name: 'want', includeIfNull: false)
  Permissons want;
  JAccessLevelData({this.mode, this.given, this.want});

  Map<String, dynamic> toJson() => _$JAccessLevelDataToJson(this);
  factory JAccessLevelData.fromJson(Map<String, dynamic> json) => _$JAccessLevelDataFromJson(json);
}
