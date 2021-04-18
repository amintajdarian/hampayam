import 'package:hampayam_chat/Model/Primitives/DescriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';

import 'MetaDelete.dart';
part 'Meta.g.dart';

@JsonSerializable(explicitToJson: true)
class JRcvMeta {
  // data props
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'topic', nullable: false)
  String topic;
  @JsonKey(name: 'ts', nullable: false)
  String ts;
  @JsonKey(name: 'desc', includeIfNull: false)
  JDescriptionData desc;
  @JsonKey(name: 'sub', includeIfNull: false)
  List<JSubscriptionData> sub;
  @JsonKey(name: 'tags', includeIfNull: false)
  List<String> tags;
  @JsonKey(name: 'cred', includeIfNull: false)
  List<JUserCredential> cred;
  @JsonKey(name: 'del', includeIfNull: false)
  JMetaDelete del;

  JRcvMeta({this.id, this.topic, this.ts, this.desc, this.sub, this.tags, this.cred, this.del});

  factory JRcvMeta.fromJson(Map<String, dynamic> json) => _$JRcvMetaFromJson(json);
  Map<String, dynamic> toJson() => _$JRcvMetaToJson(this);

  bool hasDesc() {
    if (desc != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasSub() {
    if (sub != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasCred() {
    if (cred != null) {
      return true;
    } else {
      return false;
    }
  }

  bool hasDel() {
    if (del != null) {
      return true;
    } else {
      return false;
    }
  }

  void removeSubscriptionData(item) {
    sub.remove(item);
  }

  JDescriptionData getDescription() {
    return desc;
  }

  JSubscriptionData getSubscription(int index) {
    try {
      return sub[index];
    } catch (e) {
      return null;
    }
  }

  String getTag(int index) {
    try {
      return tags.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JUserCredential getCredential(int index) {
    try {
      return cred.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JMetaDelete getDelete() {
    return del;
  }

  List<String> getTagList() {
    return tags;
  }

  List<JUserCredential> getCredentialList() {
    return cred;
  }
}
