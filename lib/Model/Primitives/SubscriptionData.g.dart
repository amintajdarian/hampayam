// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSubscriptionData _$JSubscriptionDataFromJson(Map<String, dynamic> json) {
  return JSubscriptionData(
    user: json['user'] as String,
    updated: json['updated'] == null
        ? null
        : DateTime.parse(json['updated'] as String),
    touched: json['touched'] == null
        ? null
        : DateTime.parse(json['touched'] as String),
    acs: json['acs'] == null
        ? null
        : JAccessLevelData.fromJson(json['acs'] as Map<String, dynamic>),
    read: json['read'] as int,
    recv: json['recv'] as int,
    clear: json['clear'] as int,
    public: json['public'] == null
        ? null
        : JPublicData.fromJson(json['public'] as Map<String, dynamic>),
    private: json['private'] == null
        ? null
        : JPrivateData.fromJson(json['private'] as Map<String, dynamic>),
    online: json['online'] as bool,
    topic: json['topic'] as String,
    seq: json['seq'] as int,
    seen: json['seen'] == null
        ? null
        : JSubSeen.fromJson(json['seen'] as Map<String, dynamic>),
    lastMessage: json['lastmsg'] == null
        ? null
        : LastMessage.fromJson(json['lastmsg'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JSubscriptionDataToJson(JSubscriptionData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('updated', instance.updated?.toIso8601String());
  writeNotNull('touched', instance.touched?.toIso8601String());
  writeNotNull('acs', instance.acs?.toJson());
  writeNotNull('read', instance.read);
  writeNotNull('recv', instance.recv);
  writeNotNull('clear', instance.clear);
  writeNotNull('public', instance.public?.toJson());
  writeNotNull('private', instance.private?.toJson());
  writeNotNull('online', instance.online);
  writeNotNull('topic', instance.topic);
  writeNotNull('seq', instance.seq);
  writeNotNull('seen', instance.seen?.toJson());
  writeNotNull('lastmsg', instance.lastMessage?.toJson());
  return val;
}
