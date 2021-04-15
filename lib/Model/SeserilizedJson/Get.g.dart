// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndGet _$JSndGetFromJson(Map<String, dynamic> json) {
  return JSndGet(
    id: json['id'] as String,
    topic: json['topic'] as String,
    what: json['what'] as String,
    desc: json['desc'] == null
        ? null
        : Description.fromJson(json['desc'] as Map<String, dynamic>),
    sub: json['sub'] == null
        ? null
        : Subscription.fromJson(json['sub'] as Map<String, dynamic>),
    data: json['data'] == null
        ? null
        : DataWhat.fromJson(json['data'] as Map<String, dynamic>),
    del: json['del'] == null
        ? null
        : Delete.fromJson(json['del'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSndGetToJson(JSndGet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('topic', instance.topic);
  writeNotNull('what', instance.what);
  writeNotNull('desc', instance.desc?.toJson());
  writeNotNull('sub', instance.sub?.toJson());
  writeNotNull('data', instance.data?.toJson());
  writeNotNull('del', instance.del?.toJson());
  return val;
}
