// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndLogin _$JSndLoginFromJson(Map<String, dynamic> json) {
  return JSndLogin(
    id: json['id'] as String,
    scheme: json['scheme'] as String,
    secret: json['secret'] as String,
    cred: (json['cred'] as List)
        ?.map((e) => e == null
            ? null
            : JUserCredential.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JSndLoginToJson(JSndLogin instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'scheme': instance.scheme,
    'secret': instance.secret,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cred', instance.cred);
  return val;
}
