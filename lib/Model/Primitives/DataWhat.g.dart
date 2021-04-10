// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataWhat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWhat _$DataWhatFromJson(Map<String, dynamic> json) {
  return DataWhat(
    since: json['since'] as String,
    before: json['before'] as String,
    limit: json['limit'] as String,
  );
}

Map<String, dynamic> _$DataWhatToJson(DataWhat instance) => <String, dynamic>{
      'since': instance.since,
      'before': instance.before,
      'limit': instance.limit,
    };
