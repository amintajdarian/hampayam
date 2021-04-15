// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MsgsServer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgSever _$MsgSeverFromJson(Map<String, dynamic> json) {
  return MsgSever(
    ctrl: json['ctrl'] == null
        ? null
        : JRcvCtrl.fromJson(json['ctrl'] as Map<String, dynamic>) ?? false,
    info: json['info'] == null
        ? null
        : JRcvInfo.fromJson(json['info'] as Map<String, dynamic>) ?? false,
    meta: json['meta'] == null
        ? null
        : JRcvMeta.fromJson(json['meta'] as Map<String, dynamic>) ?? false,
    msg: json['data'] == null
        ? null
        : JRcvMsg.fromJson(json['data'] as Map<String, dynamic>) ?? false,
    pres: json['pres'] == null
        ? null
        : JRcvPres.fromJson(json['pres'] as Map<String, dynamic>) ?? false,
  );
}

Map<String, dynamic> _$MsgSeverToJson(MsgSever instance) => <String, dynamic>{
      'ctrl': instance.ctrl?.toJson(),
      'info': instance.info?.toJson(),
      'meta': instance.meta?.toJson(),
      'data': instance.msg?.toJson(),
      'pres': instance.pres?.toJson(),
    };
