import 'package:json_annotation/json_annotation.dart';

import 'Telephone.dart';
part 'PrivateData.g.dart';

@JsonSerializable()
class JPrivateData {
  @JsonKey(name: "comment", includeIfNull: false)
  String comment;
  @JsonKey(name: "arch", includeIfNull: false, defaultValue: true)
  bool arch;
  @JsonKey(name: "tel")
  List<JTelephone> tel;
  @JsonKey(name: "accepted", includeIfNull: false)
  String accepted;
  JPrivateData({this.comment, this.arch, this.tel, this.accepted});
  Map<String, dynamic> toJson() => _$JPrivateDataToJson(this);

  factory JPrivateData.fromJson(Map<String, dynamic> json) => _$JPrivateDataFromJson(json);
}
