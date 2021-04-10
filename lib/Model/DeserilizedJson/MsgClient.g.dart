// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MsgClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgClient _$MsgClientFromJson(Map<String, dynamic> json) {
  return MsgClient(
    jSndNote: json['note'] == null
        ? null
        : JSndNote.fromJson(json['note'] as Map<String, dynamic>),
    jSndGet: json['get'] == null
        ? null
        : JSndGet.fromJson(json['get'] as Map<String, dynamic>),
    jSndHi: json['hi'] == null
        ? null
        : JSndHi.fromJson(json['hi'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MsgClientToJson(MsgClient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('note', instance.jSndNote?.toJson());
  writeNotNull('get', instance.jSndGet?.toJson());
  writeNotNull('hi', instance.jSndHi?.toJson());
  return val;
}
