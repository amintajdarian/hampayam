// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return Extra(
    fn: json['fn'] as String,
    message: json['message'],
  );
}

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'fn': instance.fn,
      'message': instance.message,
    };
