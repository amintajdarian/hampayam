// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DefAccessLevelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JDefAccessLevelData _$JDefAccessLevelDataFromJson(Map<String, dynamic> json) {
  return JDefAccessLevelData(
    json['auth'] as String,
    json['anon'] as String,
  );
}

Map<String, dynamic> _$JDefAccessLevelDataToJson(JDefAccessLevelData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auth', instance.auth);
  writeNotNull('anon', instance.anon);
  return val;
}
