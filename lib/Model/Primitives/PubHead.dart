import 'package:json_annotation/json_annotation.dart';

import 'PubHeadPriority.dart';
part 'PubHead.g.dart';

@JsonSerializable(explicitToJson: true)
class JPubHead {
  // data props
  @JsonKey(name: "attachments", includeIfNull: false)
  List<String> attachments; // an array of paths indicating media attached to this message ["/v0/file/s/sJOD_tZDPz0.jpg"].
  @JsonKey(name: "auto", includeIfNull: false, defaultValue: true)
  bool auto; // when the message was sent automatically, i.e. by a chatbot or an auto-responder.
  @JsonKey(name: "forwarded", includeIfNull: false)
  String forwarded; // an indicator that the message is a forwarded message, a unique ID of the original message, "grp1XUtEhjv6HND:123".
  @JsonKey(name: "hashtags", includeIfNull: false)
  List<String> hashtags; // an array of hashtags in the message without the leading # symbol: ["onehash", "twohash"].
  @JsonKey(name: "mentions", includeIfNull: false)
  List<String> mentions; // an array of user IDs mentioned (@alice) in the message: ["usr1XUtEhjv6HND", "usr2il9suCbuko"].
  @JsonKey(name: "mime", includeIfNull: false)
  String mime; // MIME-type of the message content, "text/x-drafty"; a null or a missing value is interpreted as "text/plain".
  @JsonKey(name: "priority", includeIfNull: false)
  JPubHeadPriority priority; // message display priority: hint for the client that the message should be displayed more prominently for a set period of time;
  @JsonKey(name: "replace", includeIfNull: false)
  String replace; // an indicator that the message is a correction/replacement for another message, a topic-unique ID of the message being updated/replaced, ":123"
  @JsonKey(name: "reply", includeIfNull: false)
  String reply; // an indicator that the message is a reply to another message, a unique ID of the original message, "grp1XUtEhjv6HND:123".
  @JsonKey(name: "sender", includeIfNull: false)
  String sender; // a user ID of the sender added by the server when the message is sent by on behalf of another user, "usr1XUtEhjv6HND".
  @JsonKey(name: "thread", includeIfNull: false)
  String thread; // an indicator that the message is a part of a conversation thread, a topic-unique ID of the first message in the thread, ":123".

  JPubHead({this.attachments, this.auto, this.forwarded, this.hashtags, this.mentions, this.mime, this.priority, this.replace, this.reply, this.sender, this.thread});
  Map<String, dynamic> toJson() => _$JPubHeadToJson(this);
  factory JPubHead.fromJson(Map<String, dynamic> json) => _$JPubHeadFromJson(json);

  int attachmentsLength() {
    try {
      return attachments.length;
    } catch (e) {
      return 0;
    }
  }

  int hashtagsLength() {
    try {
      return hashtags.length;
    } catch (e) {
      return 0;
    }
  }

  int mentionsLength() {
    try {
      return mentions.length;
    } catch (e) {
      return 0;
    }
  }

  String GetAttachment(int index) {
    try {
      return attachments.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  List<String> GetAttachmentList() {
    return attachments;
  }

  String GetHashtag(int index) {
    try {
      return hashtags.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  List<String> GetHashtagList() {
    return hashtags;
  }

  String GetMention(int index) {
    try {
      return mentions.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  List<String> GetMentionList() {
    return mentions;
  }

  JPubHeadPriority GetPriority() {
    return priority;
  }
}
