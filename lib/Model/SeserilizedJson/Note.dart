import 'package:json_annotation/json_annotation.dart';

part 'Note.g.dart';

@JsonSerializable()
class JSndNote {
  @JsonKey(name: 'topic')
  String topic;
  @JsonKey(name: 'what')
  String what;
  @JsonKey(name: 'seq', includeIfNull: false)
  int seq;
  @JsonKey(name: 'unread', includeIfNull: false)
  String unread;
  JSndNote({this.topic, this.what, this.seq, this.unread});

  Map<String, dynamic> toJson() => _$JSndNoteToJson(this);
  factory JSndNote.fromJson(Map<String, dynamic> json) => _$JSndNoteFromJson(json);
}
