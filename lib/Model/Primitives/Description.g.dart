// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return Description(
    json['ims'] == null ? null : DateTime.parse(json['ims'] as String),
    json['defacs'] == null
        ? null
        : JDefAccessLevelData.fromJson(json['defacs'] as Map<String, dynamic>),
    json['public'] == null
        ? null
        : JPublicData.fromJson(json['public'] as Map<String, dynamic>),
    json['private'] == null
        ? null
        : JPrivateData.fromJson(json['private'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'ims': instance.ims?.toIso8601String(),
      'defacs': instance.defacs?.toJson(),
      'public': instance.publicData?.toJson(),
      'private': instance.privateData?.toJson(),
    };
