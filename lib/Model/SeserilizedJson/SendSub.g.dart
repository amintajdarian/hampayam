// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SendSub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndSub _$JSndSubFromJson(Map<String, dynamic> json) {
  return JSndSub(
    id: json['id'] as String,
    topic: json['topic'] as String,
    bkg: json['bkg'] as bool ?? true,
    jSndSet: json['set'] == null
        ? null
        : JSndSet.fromJson(json['set'] as Map<String, dynamic>),
    jSndGet: json['get'] == null
        ? null
        : JSndGet.fromJson(json['get'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSndSubToJson(JSndSub instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['topic'] = instance.topic;
  writeNotNull('bkg', instance.bkg);
  writeNotNull('set', instance.jSndSet?.toJson());
  writeNotNull('get', instance.jSndGet?.toJson());
  return val;
}
