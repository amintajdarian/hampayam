// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MsgData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JRcvMsg _$JRcvMsgFromJson(Map<String, dynamic> json) {
  return JRcvMsg(
    topic: json['topic'] as String,
    from: json['from'] as String,
    head: json['head'] == null
        ? null
        : JPubHead.fromJson(json['head'] as Map<String, dynamic>),
    ts: json['ts'] as String,
    seq: json['seq'] as int,
    content: json['content'],
  );
}

Map<String, dynamic> _$JRcvMsgToJson(JRcvMsg instance) => <String, dynamic>{
      'topic': instance.topic,
      'from': instance.from,
      'head': instance.head?.toJson(),
      'ts': instance.ts,
      'seq': instance.seq,
      'content': instance.content,
    };
