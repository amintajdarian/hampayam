// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndHi _$JSndHiFromJson(Map<String, dynamic> json) {
  return JSndHi(
    id: json['id'] as String,
    ver: json['ver'] as String,
    ua: json['ua'] as String,
    dev: json['dev'] as String,
    plat: json['plat'] as String,
    lang: json['lang'] as String,
  );
}

Map<String, dynamic> _$JSndHiToJson(JSndHi instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'ver': instance.ver,
    'ua': instance.ua,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dev', instance.dev);
  writeNotNull('plat', instance.plat);
  val['lang'] = instance.lang;
  return val;
}
