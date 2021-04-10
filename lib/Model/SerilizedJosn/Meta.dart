import 'package:hampayam_chat/Model/Primitives/DescriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';

import 'MetaDelete.dart';

class JRcvMeta {
  // data props
  String id;
  String topic;
  String ts;
  JDescriptionData _desc;
  List<JSubscriptionData> sub;
  List<String> _tags;
  List<JUserCredential> _cred;
  JMetaDelete _del;

  // controll props
  int subListLength;
  bool hasSub;
  bool hasDesc;
  bool hasCred;
  bool hasTags;
  bool hasDel;

  JRcvMeta() {
    subListLength = 0;
    hasSub = false;
    hasDesc = false;
    hasCred = false;
    hasTags = false;
    hasDel = false;
  }

  void DecodeFromMap(Map<String, dynamic> meta) {
    // 1.2.3.set id,topic,ts
    id = meta['id'];
    topic = meta['topic'];
    ts = meta['ts'];

    // 4.set desc
    if (meta['desc'] != null) {
      hasDesc = true;
      // init desc
      _desc = JDescriptionData();
      // mount desc
      _desc.DecodeFromMap(meta['desc']);
    }

    // 5.set sub
    if (meta['sub'] != null) {
      hasSub = true;
      // get sub info from meta
      List<dynamic> subInfo = meta['sub'];
      subListLength = subInfo.length;

      sub = List<JSubscriptionData>(subListLength);
      for (var i = 0; i < subListLength; i++) {
        // init subs
        sub[i] = JSubscriptionData();
        // mount subs
        sub[i].DecodeFromMap(subInfo[i]);
      }
    }

    // 6.set tags
    if (meta['tags'] != null) {
      hasTags = true;
      // get tags info
      List<dynamic> tagsInfo = meta['tags'];
      var tagsInfoLength = tagsInfo.length;

      _tags = List<String>(tagsInfoLength);
      for (var i = 0; i < tagsInfoLength; i++) {
        _tags[i] = tagsInfo[i] as String;
      }
    }

    // 7.set userCredential
    if (meta['cred'] != null) {
      hasCred = true;
      // get cred info from meta
      List<dynamic> credInfo = meta['cred'];
      var credLength = credInfo.length;

      // init cred list
      _cred = List<JUserCredential>(credLength);
      for (var i = 0; i < credLength; i++) {
        // init cred
        _cred[i] = JUserCredential();
        // mount cred
        //  _cred[i].DecodeFromMap(credInfo[i]);
      }
    }

    // 8.set del
    if (meta['del'] != null) {
      hasDel = true;
      // init del
      _del = JMetaDelete();
      // mount del
      _del.DecodeFromMap(meta['del']);
    }
  }

  void removeSubscriptionData(item) {
    sub.remove(item);
  }

  Map<String, dynamic> GetDBMap() {
    return null;
  }

  JDescriptionData GetDescription() {
    return _desc;
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
      return _tags.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JUserCredential GetCredential(int index) {
    try {
      return _cred.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  JMetaDelete GetDelete() {
    return _del;
  }

  void SetDescription(JDescriptionData description) {
    _desc = JDescriptionData();
    _desc = description;
  }

  List<JSubscriptionData> GetSubscriptionList() {
    return sub;
  }

  void SetSubscriptionList(List<JSubscriptionData> subscriptionList) {
    sub = List<JSubscriptionData>();
    sub = subscriptionList;
  }

  List<String> GetTagList() {
    return _tags;
  }

  void SetTagList(List<String> tagList) {
    _tags = List<String>();
    _tags = tagList;
  }

  List<JUserCredential> GetCredentialList() {
    return _cred;
  }

  void SetCredentialList(List<JUserCredential> credentialList) {
    _cred = List<JUserCredential>();
    _cred = credentialList;
  }
}
