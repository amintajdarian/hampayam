import 'package:json_annotation/json_annotation.dart';
part 'IMhandle.g.dart';

@JsonSerializable()
class JIMhandle {
  @JsonKey(name: "type")
  String type; // "OTHER",
  @JsonKey(name: "uri")
  String uri; // "tinode:usrRkDVe0PYDOo"
  JIMhandle({this.type, this.uri});
  Map<String, dynamic> toJson() => _$JIMhandleToJson(this);

  factory JIMhandle.fromJson(Map<String, dynamic> json) => _$JIMhandleFromJson(json);
}
