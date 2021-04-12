// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    ims: json['ims'] == null ? null : DateTime.parse(json['ims'] as String),
    user: json['user'] as String,
    topic: json['topic'] as String,
    mode: json['mode'] as String,
    limit: json['limit'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ims', instance.ims?.toIso8601String());
  writeNotNull('user', instance.user);
  writeNotNull('topic', instance.topic);
  writeNotNull('limit', instance.limit);
  writeNotNull('mode', instance.mode);
  return val;
}
