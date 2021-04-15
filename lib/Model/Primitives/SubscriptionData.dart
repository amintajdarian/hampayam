import 'package:json_annotation/json_annotation.dart';

import 'AccessLevelData.dart';
import 'LastMessage.dart';
import 'PrivateData.dart';
import 'PublicData.dart';
import 'SubSeen.dart';
part 'SubscriptionData.g.dart';

@JsonSerializable(explicitToJson: true)
class JSubscriptionData {
  // data props
  @JsonKey(name: 'user', includeIfNull: false)
  String user;
  @JsonKey(name: 'updated', includeIfNull: false)
  DateTime updated;
  @JsonKey(name: 'touched', includeIfNull: false)
  DateTime touched;
  @JsonKey(name: 'acs', includeIfNull: false)
  JAccessLevelData acs;
  @JsonKey(name: 'read', includeIfNull: false)
  int read;
  @JsonKey(name: 'recv', includeIfNull: false)
  int recv;
  @JsonKey(name: 'clear', includeIfNull: false)
  int clear;
  @JsonKey(name: 'public', includeIfNull: false)
  JPublicData public;
  @JsonKey(name: 'private', includeIfNull: false)
  JPrivateData private;
  @JsonKey(name: 'online', includeIfNull: false)
  bool online;
  @JsonKey(name: 'topic', includeIfNull: false)
  String topic;
  @JsonKey(name: 'seq', includeIfNull: false)
  int seq;
  @JsonKey(name: 'seen', includeIfNull: false)
  JSubSeen seen;
  @JsonKey(name: 'lastmsg', includeIfNull: false)
  LastMessage lastMessage;

  JSubscriptionData({this.user, this.updated, this.touched, this.acs, this.read, this.recv, this.clear, this.public, this.private, this.online, this.topic, this.seq, this.seen, this.lastMessage});

  factory JSubscriptionData.fromJson(Map<String, dynamic> json) => _$JSubscriptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$JSubscriptionDataToJson(this);

  hasAcs() {
    if (acs != null) {
      return true;
    } else {
      return false;
    }
  }

  hasPrivate() {
    if (private != null) {
      return true;
    } else {
      return false;
    }
  }

  hasPublic() {
    if (public != null) {
      return true;
    } else {
      return false;
    }
  }

  hasSeen() {
    if (seen != null) {
      return true;
    } else {
      return false;
    }
  }
}
