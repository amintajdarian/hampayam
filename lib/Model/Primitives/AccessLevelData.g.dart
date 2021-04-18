// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccessLevelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JAccessLevelData _$JAccessLevelDataFromJson(Map<String, dynamic> json) {
  return JAccessLevelData(
    mode: json['mode'] == null ? null : Permissons.fromJson(json['mode'] as String),
    given: json['given'] == null ? null : Permissons.fromJson(json['given'] as String),
    want: json['want'] == null ? null : Permissons.fromJson(json['want'] as String),
  );
}

Map<String, dynamic> _$JAccessLevelDataToJson(JAccessLevelData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  return val;
}
