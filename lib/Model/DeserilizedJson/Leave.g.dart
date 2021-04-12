// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSndLeave _$JSndLeaveFromJson(Map<String, dynamic> json) {
  return JSndLeave(
    id: json['id'] as String,
    topic: json['topic'] as String,
    unSub: json['unsub'] as bool ?? true,
  );
}

Map<String, dynamic> _$JSndLeaveToJson(JSndLeave instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['topic'] = instance.topic;
  writeNotNull('unsub', instance.unSub);
  return val;
}
