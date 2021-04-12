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
    login: json['login'] as bool ?? true,
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

Map<String, dynamic> _$JSndAccToJson(JSndAcc instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user', instance.user);
  writeNotNull('token', instance.token);
  writeNotNull('status', instance.status);
  writeNotNull('scheme', instance.scheme);
  writeNotNull('secret', instance.secret);
  writeNotNull('login', instance.login);
  writeNotNull('tags', instance.tags);
  writeNotNull('cred', instance.cred?.map((e) => e?.toJson())?.toList());
  writeNotNull('desc', instance.desc?.toJson());
  return val;
}
