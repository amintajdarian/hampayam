// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PrivateData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JPrivateData _$JPrivateDataFromJson(Map<String, dynamic> json) {
  return JPrivateData(
    comment: json['comment'] as String,
    arch: json['arch'] as bool,
    tel: (json['tel'] as List)
        ?.map((e) =>
            e == null ? null : JTelephone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    accepted: json['accepted'] as String,
  );
}

Map<String, dynamic> _$JPrivateDataToJson(JPrivateData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  writeNotNull('arch', instance.arch);
  val['tel'] = instance.tel;
  writeNotNull('accepted', instance.accepted);
  return val;
}
