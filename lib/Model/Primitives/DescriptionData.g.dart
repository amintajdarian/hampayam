// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DescriptionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JDescriptionData _$JDescriptionDataFromJson(Map<String, dynamic> json) {
  return JDescriptionData(
    created: json['created'] as String,
    updated: json['updated'] as String,
    status: json['status'] as String,
    defacs: json['defacs'] == null
        ? null
        : JDefAccessLevelData.fromJson(json['defacs'] as Map<String, dynamic>),
    acs: json['acs'] == null
        ? null
        : JAccessLevelData.fromJson(json['acs'] as Map<String, dynamic>),
    seq: json['seq'] as int,
    read: json['read'] as int,
    recv: json['recv'] as int,
    clear: json['clear'] as int,
    public: json['public'] == null
        ? null
        : JPublicData.fromJson(json['public'] as Map<String, dynamic>),
    private: json['private'] == null
        ? null
        : JPrivateData.fromJson(json['private'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JDescriptionDataToJson(JDescriptionData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created', instance.created);
  writeNotNull('updated', instance.updated);
  writeNotNull('status', instance.status);
  writeNotNull('defacs', instance.defacs?.toJson());
  writeNotNull('acs', instance.acs?.toJson());
  writeNotNull('seq', instance.seq);
  writeNotNull('read', instance.read);
  writeNotNull('recv', instance.recv);
  writeNotNull('clear', instance.clear);
  writeNotNull('public', instance.public?.toJson());
  writeNotNull('private', instance.private?.toJson());
  return val;
}
