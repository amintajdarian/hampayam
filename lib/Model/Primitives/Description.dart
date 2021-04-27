import 'package:json_annotation/json_annotation.dart';

import 'DefAccessLevelData.dart';
import 'PrivateData.dart';
import 'PublicData.dart';

part 'Description.g.dart';

@JsonSerializable(explicitToJson: true)
class Description {
  @JsonKey(name: "ims")
  DateTime ims;
  @JsonKey(name: "defacs", includeIfNull: false)
  JDefAccessLevelData defacs;
  @JsonKey(name: "public", includeIfNull: false)
  JPublicData publicData;
  @JsonKey(name: "private", includeIfNull: false)
  JPrivateData privateData;
  Description({this.ims, this.defacs, this.publicData, this.privateData});
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);
}
