// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JName _$JNameFromJson(Map<String, dynamic> json) {
  return JName(
    surname: json['surname'] as String,
    given: json['given'] as String,
    additional: json['additional'] as String,
    prefix: json['prefix'] as String,
    suffix: json['suffix'] as String,
  );
}

Map<String, dynamic> _$JNameToJson(JName instance) => <String, dynamic>{
      'surname': instance.surname,
      'given': instance.given,
      'additional': instance.additional,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
    };
