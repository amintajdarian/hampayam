import 'package:json_annotation/json_annotation.dart';

part 'LastMessage.g.dart';

@JsonSerializable()
class LastMessage {
  // data prop
  @JsonKey(name: 'fn')
  String fn;
  @JsonKey(name: 'from')
  String from;
  @JsonKey(name: 'message')
  Object message;

  LastMessage({this.fn, this.from, this.message});
  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
  factory LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);
}
