import 'package:json_annotation/json_annotation.dart';
part 'Info.g.dart';

@JsonSerializable()
class JRcvInfo {
  @JsonKey(name: 'topic')
  String topic;
  @JsonKey(name: 'from')
  String from;
  @JsonKey(name: 'what')
  String what;
  @JsonKey(name: 'seq')
  int seq;
  JRcvInfo({this.topic, this.from, this.what, this.seq});

  factory JRcvInfo.fromJson(Map<String, dynamic> json) => _$JRcvInfoFromJson(json);
  Map<String, dynamic> toJson() => _$JRcvInfoToJson(this);
}
