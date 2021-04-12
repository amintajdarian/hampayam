import 'package:json_annotation/json_annotation.dart';
part 'TextFormat.g.dart';

@JsonSerializable()
class JTextFormat {
  // data prop
  @JsonKey(name: 'at', includeIfNull: false)
  int at;
  @JsonKey(name: 'len', includeIfNull: false)
  int len;
  @JsonKey(name: 'tp', includeIfNull: false)
  String tp;
  @JsonKey(name: 'key', includeIfNull: false)
  int key;
  JTextFormat({this.at, this.len, this.key, this.tp});

  Map<String, dynamic> toJson() => _$JTextFormatToJson(this);
  factory JTextFormat.fromJson(Map<String, dynamic> json) => _$JTextFormatFromJson(json);
}
