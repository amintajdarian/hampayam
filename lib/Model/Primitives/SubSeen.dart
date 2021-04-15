import 'package:json_annotation/json_annotation.dart';
part 'SubSeen.g.dart';

@JsonSerializable()
class JSubSeen {
  @JsonKey(name: 'when', includeIfNull: false)
  String when;
  @JsonKey(name: 'ua', includeIfNull: false)
  String ua;
  JSubSeen({this.when, this.ua});
  Map<String, dynamic> toJson() => _$JSubSeenToJson(this);
  factory JSubSeen.fromJson(Map<String, dynamic> json) => _$JSubSeenFromJson(json);
}
