import 'package:json_annotation/json_annotation.dart';
part 'Hi.g.dart';

@JsonSerializable()
class JSndHi {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "ver")
  String ver;
  @JsonKey(name: "ua")
  String ua;
  @JsonKey(name: "dev", includeIfNull: false)
  String dev;
  @JsonKey(name: "plat", includeIfNull: false)
  String plat;
  @JsonKey(name: "lang")
  String lang;
  JSndHi({this.id, this.ver, this.ua, this.dev, this.plat, this.lang});
  factory JSndHi.fromJson(Map<String, dynamic> json) => _$JSndHiFromJson(json);
  Map<String, dynamic> toJson() => _$JSndHiToJson(this);
}
