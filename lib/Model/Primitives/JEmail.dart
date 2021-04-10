import 'package:json_annotation/json_annotation.dart';
part 'JEmail.g.dart';

@JsonSerializable()
class JEmail {
  @JsonKey(name: "type")
  String type; // "HOME", // string, optional designation
  @JsonKey(name: "uri")
  String uri; // "email:alice@example.com" // string, email address
  JEmail({this.type, this.uri});
  Map<String, dynamic> toJson() => _$JEmailToJson(this);

  factory JEmail.fromJson(Map<String, dynamic> json) => _$JEmailFromJson(json);
}
