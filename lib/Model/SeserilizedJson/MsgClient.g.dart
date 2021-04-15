// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MsgClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgClient _$MsgClientFromJson(Map<String, dynamic> json) {
  return MsgClient(
    jSndHi: json['hi'] == null
        ? null
        : JSndHi.fromJson(json['hi'] as Map<String, dynamic>),
    jSndAcc: json['acc'] == null
        ? null
        : JSndAcc.fromJson(json['acc'] as Map<String, dynamic>),
    jSndLogin: json['login'] == null
        ? null
        : JSndLogin.fromJson(json['login'] as Map<String, dynamic>),
    jSndSub: json['sub'] == null
        ? null
        : JSndSub.fromJson(json['sub'] as Map<String, dynamic>),
    jSndLeave: json['leave'] == null
        ? null
        : JSndLeave.fromJson(json['leave'] as Map<String, dynamic>),
    jSndPub: json['pub'] == null
        ? null
        : JSndPub.fromJson(json['pub'] as Map<String, dynamic>),
    jSndGet: json['get'] == null
        ? null
        : JSndGet.fromJson(json['get'] as Map<String, dynamic>),
    jSndSet: json['set'] == null
        ? null
        : JSndSet.fromJson(json['set'] as Map<String, dynamic>),
    jSndDel: json['del'] == null
        ? null
        : JSndDel.fromJson(json['del'] as Map<String, dynamic>),
    jSndNote: json['note'] == null
        ? null
        : JSndNote.fromJson(json['note'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MsgClientToJson(MsgClient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hi', instance.jSndHi?.toJson());
  writeNotNull('acc', instance.jSndAcc?.toJson());
  writeNotNull('login', instance.jSndLogin?.toJson());
  writeNotNull('sub', instance.jSndSub?.toJson());
  writeNotNull('leave', instance.jSndLeave?.toJson());
  writeNotNull('pub', instance.jSndPub?.toJson());
  writeNotNull('get', instance.jSndGet?.toJson());
  writeNotNull('set', instance.jSndSet?.toJson());
  writeNotNull('del', instance.jSndDel?.toJson());
  writeNotNull('note', instance.jSndNote?.toJson());
  return val;
}
