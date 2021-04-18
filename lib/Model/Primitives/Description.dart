import 'package:json_annotation/json_annotation.dart';

import 'DefAccessLevelData.dart';
import 'PrivateData.dart';
import 'PublicData.dart';

part 'Description.g.dart';

@JsonSerializable(explicitToJson: true)
class Description {
  @JsonKey(name: "ims")
  DateTime ims;
  @JsonKey(name: "defacs")
  JDefAccessLevelData defacs;
  @JsonKey(name: "public", includeIfNull: true)
  JPublicData publicData;
  @JsonKey(name: "private", includeIfNull: true)
  JPrivateData privateData;
  Description({this.ims, this.defacs, this.publicData, this.privateData});
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);
}
