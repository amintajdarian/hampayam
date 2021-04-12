// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PubContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPubContent _$JPubContentFromJson(Map<String, dynamic> json) {
  return JPubContent(
    text: json['text'] as String,
    fmt: (json['fmt'] as List)
        ?.map((e) =>
            e == null ? null : JTextFormat.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ent: (json['ent'] as List)
        ?.map((e) =>
            e == null ? null : JTextEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JPubContentToJson(JPubContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('fmt', instance.fmt?.map((e) => e?.toJson())?.toList());
  writeNotNull('ent', instance.ent?.map((e) => e?.toJson())?.toList());
  return val;
}
