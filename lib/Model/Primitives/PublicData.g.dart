// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublicData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPublicData _$JPublicDataFromJson(Map<String, dynamic> json) {
  return JPublicData(
    fn: json['fn'] as String,
    n: json['n'] == null
        ? null
        : JName.fromJson(json['n'] as Map<String, dynamic>),
    org: json['org'] as String,
    title: json['title'] as String,
    tel: (json['tel'] as List)
        ?.map((e) =>
            e == null ? null : JTelephone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    email: (json['email'] as List)
        ?.map((e) =>
            e == null ? null : JEmail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    impp: (json['impp'] as List)
        ?.map((e) =>
            e == null ? null : JIMhandle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    photo: json['photo'] == null
        ? null
        : JPhoto.fromJson(json['photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JPublicDataToJson(JPublicData instance) {
  final val = <String, dynamic>{
    'fn': instance.fn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n', instance.n?.toJson());
  writeNotNull('org', instance.org);
  writeNotNull('title', instance.title);
  writeNotNull('tel', instance.tel?.map((e) => e?.toJson())?.toList());
  writeNotNull('email', instance.email?.map((e) => e?.toJson())?.toList());
  writeNotNull('impp', instance.impp?.map((e) => e?.toJson())?.toList());
  writeNotNull('photo', instance.photo?.toJson());
  return val;
}
