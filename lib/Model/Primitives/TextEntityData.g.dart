// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TextEntityData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JTextEntityData _$JTextEntityDataFromJson(Map<String, dynamic> json) {
  return JTextEntityData(
    mime: json['mime'] as String,
    val: json['val'] as String,
    ref: json['ref'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    name: json['name'] as String,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$JTextEntityDataToJson(JTextEntityData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mime', instance.mime);
  writeNotNull('val', instance.val);
  writeNotNull('ref', instance.ref);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('name', instance.name);
  writeNotNull('size', instance.size);
  return val;
}
