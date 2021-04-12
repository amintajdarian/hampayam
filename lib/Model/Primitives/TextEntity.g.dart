// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TextEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JTextEntity _$JTextEntityFromJson(Map<String, dynamic> json) {
  return JTextEntity(
    tp: json['tp'] as String,
    data: json['data'] == null
        ? null
        : JTextEntityData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JTextEntityToJson(JTextEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tp', instance.tp);
  writeNotNull('data', instance.data?.toJson());
  return val;
}
