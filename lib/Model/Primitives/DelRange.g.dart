// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DelRange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JDelRange _$JDelRangeFromJson(Map<String, dynamic> json) {
  return JDelRange(
    low: json['low'] as int,
    hi: json['hi'] as int,
  );
}

Map<String, dynamic> _$JDelRangeToJson(JDelRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('low', instance.low);
  writeNotNull('hi', instance.hi);
  return val;
}
