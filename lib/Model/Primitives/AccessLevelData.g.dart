// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccessLevelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JAccessLevelData _$JAccessLevelDataFromJson(Map<String, dynamic> json) {
  return JAccessLevelData(
    mode: json['mode'],
    given: json['given'],
    want: json['want'],
  );
}

Map<String, dynamic> _$JAccessLevelDataToJson(JAccessLevelData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mode', instance.mode);
  writeNotNull('given', instance.given);
  writeNotNull('want', instance.want);
  return val;
}
