// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataWhat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataWhat _$DataWhatFromJson(Map<String, dynamic> json) {
  return DataWhat(
    since: json['since'] as int,
    before: json['before'] as int,
    limit: json['limit'] as int,
  );
}

Map<String, dynamic> _$DataWhatToJson(DataWhat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('since', instance.since);
  writeNotNull('before', instance.before);
  writeNotNull('limit', instance.limit);
  return val;
}
