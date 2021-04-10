// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserCredential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JUserCredential _$JUserCredentialFromJson(Map<String, dynamic> json) {
  return JUserCredential(
    meth: json['meth'] as String,
    val: json['val'] as String,
    resp: json['resp'] as String,
    done: json['done'] as bool,
  );
}

Map<String, dynamic> _$JUserCredentialToJson(JUserCredential instance) {
  final val = <String, dynamic>{
    'meth': instance.meth,
    'val': instance.val,
    'resp': instance.resp,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('done', instance.done);
  return val;
}
