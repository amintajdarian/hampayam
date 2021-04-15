// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndPub _$JSndPubFromJson(Map<String, dynamic> json) {
  return JSndPub(
    id: json['id'] as String,
    topic: json['topic'] as String,
    noecho: json['noecho'] as bool ?? false,
    head: json['head'] == null
        ? null
        : JPubHead.fromJson(json['head'] as Map<String, dynamic>),
    content: json['content'],
  );
}

Map<String, dynamic> _$JSndPubToJson(JSndPub instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['topic'] = instance.topic;
  writeNotNull('noecho', instance.noecho);
  writeNotNull('head', instance.head);
  writeNotNull('content', instance.content);
  return val;
}
