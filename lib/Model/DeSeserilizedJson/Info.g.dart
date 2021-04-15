// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JRcvInfo _$JRcvInfoFromJson(Map<String, dynamic> json) {
  return JRcvInfo(
    topic: json['topic'] as String,
    from: json['from'] as String,
    what: json['what'] as String,
    seq: json['seq'] as int,
  );
}

Map<String, dynamic> _$JRcvInfoToJson(JRcvInfo instance) => <String, dynamic>{
      'topic': instance.topic,
      'from': instance.from,
      'what': instance.what,
      'seq': instance.seq,
    };
