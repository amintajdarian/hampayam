// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MetaDelete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JMetaDelete _$JMetaDeleteFromJson(Map<String, dynamic> json) {
  return JMetaDelete(
    clear: json['clear'] as int,
    delseq: (json['delseq'] as List)
        ?.map((e) =>
            e == null ? null : JDelRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JMetaDeleteToJson(JMetaDelete instance) =>
    <String, dynamic>{
      'clear': instance.clear,
      'delseq': instance.delseq?.map((e) => e?.toJson())?.toList(),
    };
