import 'package:json_annotation/json_annotation.dart';
part 'DelRange.g.dart';

@JsonSerializable()
class JDelRange {
  @JsonKey(name: 'low', includeIfNull: false)
  int low;
  @JsonKey(name: 'hi', includeIfNull: false)
  int hi;
  JDelRange({this.low, this.hi});
  factory JDelRange.fromJson(Map<String, dynamic> json) => _$JDelRangeFromJson(json);
  Map<String, dynamic> toJson() => _$JDelRangeToJson(this);
}
