// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PubHead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPubHead _$JPubHeadFromJson(Map<String, dynamic> json) {
  return JPubHead(
    (json['attachments'] as List)?.map((e) => e as String)?.toList(),
    json['auto'] as bool ?? true,
    json['forwarded'] as String,
    (json['hashtags'] as List)?.map((e) => e as String)?.toList(),
    (json['mentions'] as List)?.map((e) => e as String)?.toList(),
    json['mime'] as String,
    json['priority'] == null
        ? null
        : JPubHeadPriority.fromJson(json['priority'] as Map<String, dynamic>),
    json['replace'] as String,
    json['reply'] as String,
    json['sender'] as String,
    json['thread'] as String,
  );
}

Map<String, dynamic> _$JPubHeadToJson(JPubHead instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attachments', instance.attachments);
  writeNotNull('auto', instance.auto);
  writeNotNull('forwarded', instance.forwarded);
  writeNotNull('hashtags', instance.hashtags);
  writeNotNull('mentions', instance.mentions);
  writeNotNull('mime', instance.mime);
  writeNotNull('priority', instance.priority?.toJson());
  writeNotNull('replace', instance.replace);
  writeNotNull('reply', instance.reply);
  writeNotNull('sender', instance.sender);
  writeNotNull('thread', instance.thread);
  return val;
}
