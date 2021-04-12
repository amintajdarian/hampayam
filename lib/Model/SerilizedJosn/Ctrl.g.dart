// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ctrl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JRcvCtrl _$JRcvCtrlFromJson(Map<String, dynamic> json) {
  return JRcvCtrl(
    id: json['id'] as String,
    topic: json['topic'] as String,
    code: json['code'] as int,
    text: json['text'] as String,
    ts: json['ts'] as String,
    params: json['params'] == null
        ? null
        : Params.fromJson(json['params'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JRcvCtrlToJson(JRcvCtrl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('topic', instance.topic);
  writeNotNull('code', instance.code);
  writeNotNull('text', instance.text);
  writeNotNull('ts', instance.ts);
  writeNotNull('params', instance.params?.toJson());
  return val;
}
