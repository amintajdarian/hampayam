// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndSet _$JSndSetFromJson(Map<String, dynamic> json) {
  return JSndSet(
    id: json['id'] as String,
    topic: json['topic'] as String,
    desc: json['desc'] == null
        ? null
        : Description.fromJson(json['desc'] as Map<String, dynamic>),
    sub: json['sub'] == null
        ? null
        : Subscription.fromJson(json['sub'] as Map<String, dynamic>),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    cred: json['cred'] == null
        ? null
        : JUserCredential.fromJson(json['cred'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSndSetToJson(JSndSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['topic'] = instance.topic;
  writeNotNull('desc', instance.desc?.toJson());
  writeNotNull('sub', instance.sub?.toJson());
  writeNotNull('tags', instance.tags);
  writeNotNull('cred', instance.cred?.toJson());
  return val;
}
