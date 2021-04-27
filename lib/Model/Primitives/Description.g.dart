// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return Description(
    ims: json['ims'] == null ? null : DateTime.parse(json['ims'] as String),
    defacs: json['defacs'] == null
        ? null
        : JDefAccessLevelData.fromJson(json['defacs'] as Map<String, dynamic>),
    publicData: json['public'] == null
        ? null
        : JPublicData.fromJson(json['public'] as Map<String, dynamic>),
    privateData: json['private'] == null
        ? null
        : JPrivateData.fromJson(json['private'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescriptionToJson(Description instance) {
  final val = <String, dynamic>{
    'ims': instance.ims?.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('defacs', instance.defacs?.toJson());
  writeNotNull('public', instance.publicData?.toJson());
  writeNotNull('private', instance.privateData?.toJson());
  return val;
}
