// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndNote _$JSndNoteFromJson(Map<String, dynamic> json) {
  return JSndNote(
    topic: json['topic'] as String,
    what: json['what'] as String,
    seq: json['seq'] as int,
    unread: json['unread'] as String,
  );
}

Map<String, dynamic> _$JSndNoteToJson(JSndNote instance) {
  final val = <String, dynamic>{
    'topic': instance.topic,
    'what': instance.what,
    'seq': instance.seq,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unread', instance.unread);
  return val;
}
