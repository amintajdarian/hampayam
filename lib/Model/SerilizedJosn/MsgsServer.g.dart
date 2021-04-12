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
  );
}

Map<String, dynamic> _$MsgSeverToJson(MsgSever instance) => <String, dynamic>{
      'ctrl': instance.ctrl?.toJson(),
    };
