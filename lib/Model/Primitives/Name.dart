import 'package:json_annotation/json_annotation.dart';
part 'Name.g.dart';

@JsonSerializable()
class JName {
  @JsonKey(name: "surname")
  String surname; // last of family name
  @JsonKey(name: "given")
  String given; // first or given name
  @JsonKey(name: "additional")
  String additional; // additional name, such as middle name or patronymic or nickname.
  @JsonKey(name: "prefix")
  String prefix; // prefix, such as honorary title or gender designation.
  @JsonKey(name: "suffix")
  String suffix; // suffix, such as 'Jr' or 'II'
  JName({this.surname, this.given, this.additional, this.prefix, this.suffix});
  Map<String, dynamic> toJson() => _$JNameToJson(this);

  factory JName.fromJson(Map<String, dynamic> json) => _$JNameFromJson(json);
}
