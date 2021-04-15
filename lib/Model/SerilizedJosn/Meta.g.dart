// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JRcvMeta _$JRcvMetaFromJson(Map<String, dynamic> json) {
  return JRcvMeta(
    id: json['id'] as String,
    topic: json['topic'] as String,
    ts: json['ts'] as String,
    desc: json['desc'] == null
        ? null
        : JDescriptionData.fromJson(json['desc'] as Map<String, dynamic>),
    sub: (json['sub'] as List)
        ?.map((e) => e == null
            ? null
            : JSubscriptionData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    cred: (json['cred'] as List)
        ?.map((e) => e == null
            ? null
            : JUserCredential.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    del: json['del'] == null
        ? null
        : JMetaDelete.fromJson(json['del'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JRcvMetaToJson(JRcvMeta instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'topic': instance.topic,
    'ts': instance.ts,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('desc', instance.desc?.toJson());
  writeNotNull('sub', instance.sub?.map((e) => e?.toJson())?.toList());
  writeNotNull('tags', instance.tags);
  writeNotNull('cred', instance.cred?.map((e) => e?.toJson())?.toList());
  writeNotNull('del', instance.del?.toJson());
  return val;
}
