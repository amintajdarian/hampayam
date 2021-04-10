// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPhoto _$JPhotoFromJson(Map<String, dynamic> json) {
  return JPhoto(
    data: json['data'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$JPhotoToJson(JPhoto instance) => <String, dynamic>{
      'data': instance.data,
      'type': instance.type,
    };
