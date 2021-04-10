// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndAcc _$JSndAccFromJson(Map<String, dynamic> json) {
  return JSndAcc(
    id: json['id'] as String,
    user: json['user'] as String,
    token: json['token'] as String,
    status: json['status'] as String,
    scheme: json['scheme'] as String,
    secret: json['secret'] as String,
    login: json['login'] as bool,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    cred: (json['cred'] as List)
        ?.map((e) => e == null
            ? null
            : JUserCredential.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    desc: json['desc'] == null
        ? null
        : Description.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSndAccToJson(JSndAcc instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'token': instance.token,
      'status': instance.status,
      'scheme': instance.scheme,
      'secret': instance.secret,
      'login': instance.login,
      'tags': instance.tags,
      'cred': instance.cred?.map((e) => e?.toJson())?.toList(),
      'desc': instance.desc?.toJson(),
    };
