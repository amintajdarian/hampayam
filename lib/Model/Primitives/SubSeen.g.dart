// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubSeen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSubSeen _$JSubSeenFromJson(Map<String, dynamic> json) {
  return JSubSeen(
    when: json['when'] as String,
    ua: json['ua'] as String,
  );
}

Map<String, dynamic> _$JSubSeenToJson(JSubSeen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('when', instance.when);
  writeNotNull('ua', instance.ua);
  return val;
}
