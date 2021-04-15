// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JRcvPres _$JRcvPresFromJson(Map<String, dynamic> json) {
  return JRcvPres(
    topic: json['topic'] as String,
    src: json['src'] as String,
    what: json['what'] as String,
    seq: json['seq'] as int,
    clear: json['clear'] as int,
    ua: json['ua'] as String,
    act: json['act'] as String,
    tgt: json['tgt'] as String,
    dacs: json['dacs'] == null
        ? null
        : JAccessLevelData.fromJson(json['dacs'] as Map<String, dynamic>),
    acs: json['acs'] == null
        ? null
        : JAccessLevelData.fromJson(json['acs'] as Map<String, dynamic>),
    delseq: (json['delseq'] as List)
        ?.map((e) =>
            e == null ? null : JDelRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    extra: json['extra'] == null
        ? null
        : Extra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JRcvPresToJson(JRcvPres instance) {
  final val = <String, dynamic>{
    'topic': instance.topic,
    'src': instance.src,
    'what': instance.what,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seq', instance.seq);
  writeNotNull('clear', instance.clear);
  writeNotNull('ua', instance.ua);
  writeNotNull('act', instance.act);
  writeNotNull('tgt', instance.tgt);
  writeNotNull('dacs', instance.dacs?.toJson());
  writeNotNull('acs', instance.acs?.toJson());
  writeNotNull('delseq', instance.delseq?.map((e) => e?.toJson())?.toList());
  writeNotNull('extra', instance.extra?.toJson());
  return val;
}
