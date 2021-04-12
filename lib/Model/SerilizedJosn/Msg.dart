import 'package:hampayam_chat/Model/Primitives/PubContent.dart';
import 'package:hampayam_chat/Model/Primitives/PubHead.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Msg.g.dart';

@JsonSerializable(explicitToJson: true)
class JRcvMsg {
  // data prop
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'from', nullable: false)
  String from;
  @JsonKey(name: 'head')
  JPubHead head;
  @JsonKey(name: 'ts', nullable: false)
  String ts;
  @JsonKey(name: 'seq', nullable: false)
  int seq;
  @JsonKey(name: 'content')
  dynamic content;

  // controll prop
  JRcvMsg({this.topic, this.from, this.head, this.ts, this.seq, this.content});
}
