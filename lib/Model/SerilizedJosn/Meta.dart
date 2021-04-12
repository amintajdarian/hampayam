import 'package:hampayam_chat/Model/Primitives/DescriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:json_annotation/json_annotation.dart';

import 'MetaDelete.dart';

@JsonSerializable(explicitToJson: true)
class JRcvMeta {
  // data props
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'id', nullable: false)
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

  void removeSubscriptionData(item) {
    sub.remove(item);
  }

  Map<String, dynamic> GetDBMap() {
    return null;
  }

  JDescriptionData GetDescription() {
    return desc;
  }

  JSubscriptionData GetSubscription(int index) {
    try {
      return sub[index];
    } catch (e) {
      return null;
    }
  }

  String GetTag(int index) {
    try {
      return tags.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JUserCredential GetCredential(int index) {
    try {
      return cred.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JMetaDelete GetDelete() {
    return del;
  }

  void SetDescription(JDescriptionData description) {
    desc = JDescriptionData();
    desc = description;
  }

  List<JSubscriptionData> GetSubscriptionList() {
    return sub;
  }

  void SetSubscriptionList(List<JSubscriptionData> subscriptionList) {
    sub = List<JSubscriptionData>();
    sub = subscriptionList;
  }

  List<String> GetTagList() {
    return tags;
  }

  void SetTagList(List<String> tagList) {
    tags = List<String>();
    tags = tagList;
  }

  List<JUserCredential> GetCredentialList() {
    return cred;
  }

  void SetCredentialList(List<JUserCredential> credentialList) {
    cred = List<JUserCredential>();
    cred = credentialList;
  }
}
