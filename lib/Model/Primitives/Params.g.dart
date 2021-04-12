// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return Params(
    build: json['build'] as String,
    maxFileUploadSize: json['maxFileUploadSize'] as int,
    maxMessageSize: json['maxMessageSize'] as int,
    maxSubscriberCount: json['maxSubscriberCount'] as int,
    maxTagCount: json['maxTagCount'] as int,
    maxTagLength: json['maxTagLength'] as int,
    minTagLength: json['minTagLength'] as int,
    ver: json['ver'] as String,
    authlvl: json['authlvl'] as String,
    expires: json['expires'] as String,
    token: json['token'] as String,
    user: json['user'] as String,
    count: json['count'] as int,
    what: json['what'] as String,
    url: json['url'] as String,
    seq: json['seq'] as int,
  );
}

Map<String, dynamic> _$ParamsToJson(Params instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('build', instance.build);
  writeNotNull('maxFileUploadSize', instance.maxFileUploadSize);
  writeNotNull('maxMessageSize', instance.maxMessageSize);
  writeNotNull('maxSubscriberCount', instance.maxSubscriberCount);
  writeNotNull('maxTagCount', instance.maxTagCount);
  writeNotNull('maxTagLength', instance.maxTagLength);
  writeNotNull('minTagLength', instance.minTagLength);
  writeNotNull('ver', instance.ver);
  writeNotNull('authlvl', instance.authlvl);
  writeNotNull('expires', instance.expires);
  writeNotNull('token', instance.token);
  writeNotNull('user', instance.user);
  writeNotNull('count', instance.count);
  writeNotNull('what', instance.what);
  writeNotNull('url', instance.url);
  writeNotNull('seq', instance.seq);
  return val;
}
