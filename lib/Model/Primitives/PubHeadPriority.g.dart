// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PubHeadPriority.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPubHeadPriority _$JPubHeadPriorityFromJson(Map<String, dynamic> json) {
  return JPubHeadPriority(
    level: json['level'] as String,
    expires: json['expires'] as String,
  );
}

Map<String, dynamic> _$JPubHeadPriorityToJson(JPubHeadPriority instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('level', instance.level);
  writeNotNull('expires', instance.expires);
  return val;
}
