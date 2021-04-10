import 'package:json_annotation/json_annotation.dart';
part 'Telephone.g.dart';

@JsonSerializable()
class JTelephone {
  @JsonKey(name: "type")
  String type; // "HOME", // string, optional designation
  @JsonKey(name: "uri")
  String uri; // "tel:+17025551234" // string, phone number
  JTelephone({this.type, this.uri});
  Map<String, dynamic> toJson() => _$JTelephoneToJson(this);
  factory JTelephone.fromJson(Map<String, dynamic> json) => _$JTelephoneFromJson(json);
}
