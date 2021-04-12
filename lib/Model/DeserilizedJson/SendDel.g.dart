// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SendDel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndDel _$JSndDelFromJson(Map<String, dynamic> json) {
  return JSndDel(
    id: json['id'] as String,
    topic: json['topic'] as String,
    what: json['what'] as String,
    hard: json['hard'] as bool ?? false,
    delSeq: (json['delseq'] as List)
        ?.map((e) =>
            e == null ? null : JDelRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] as String,
    cred: json['cred'] == null
        ? null
        : JUserCredential.fromJson(json['cred'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSndDelToJson(JSndDel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('topic', instance.topic);
  writeNotNull('what', instance.what);
  writeNotNull('hard', instance.hard);
  writeNotNull('delseq', instance.delSeq?.map((e) => e?.toJson())?.toList());
  writeNotNull('user', instance.user);
  writeNotNull('cred', instance.cred?.toJson());
  return val;
}
