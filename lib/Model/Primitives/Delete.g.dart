// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Delete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delete _$DeleteFromJson(Map<String, dynamic> json) {
  return Delete(
    since: json['since'] as String,
    before: json['before'] as String,
    limit: json['limit'] as String,
  );
}

Map<String, dynamic> _$DeleteToJson(Delete instance) => <String, dynamic>{
      'since': instance.since,
      'before': instance.before,
      'limit': instance.limit,
    };
