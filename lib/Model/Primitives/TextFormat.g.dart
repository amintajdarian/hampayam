// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TextFormat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JTextFormat _$JTextFormatFromJson(Map<String, dynamic> json) {
  return JTextFormat(
    at: json['at'] as int,
    len: json['len'] as int,
    key: json['key'] as int,
    tp: json['tp'] as String,
  );
}

Map<String, dynamic> _$JTextFormatToJson(JTextFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('at', instance.at);
  writeNotNull('len', instance.len);
  writeNotNull('tp', instance.tp);
  writeNotNull('key', instance.key);
  return val;
}
