import 'PubHeadPriority.dart';

class JPubHead {
  // data props
  List<String> attachments; // an array of paths indicating media attached to this message ["/v0/file/s/sJOD_tZDPz0.jpg"].
  bool auto; // when the message was sent automatically, i.e. by a chatbot or an auto-responder.
  String forwarded; // an indicator that the message is a forwarded message, a unique ID of the original message, "grp1XUtEhjv6HND:123".
  List<String> _hashtags; // an array of hashtags in the message without the leading # symbol: ["onehash", "twohash"].
  List<String> _mentions; // an array of user IDs mentioned (@alice) in the message: ["usr1XUtEhjv6HND", "usr2il9suCbuko"].
  String mime; // MIME-type of the message content, "text/x-drafty"; a null or a missing value is interpreted as "text/plain".
  JPubHeadPriority _priority; // message display priority: hint for the client that the message should be displayed more prominently for a set period of time;
  String replace; // an indicator that the message is a correction/replacement for another message, a topic-unique ID of the message being updated/replaced, ":123"
  String reply; // an indicator that the message is a reply to another message, a unique ID of the original message, "grp1XUtEhjv6HND:123".
  String sender; // a user ID of the sender added by the server when the message is sent by on behalf of another user, "usr1XUtEhjv6HND".
  String thread; // an indicator that the message is a part of a conversation thread, a topic-unique ID of the first message in the thread, ":123".

  // controll props
  bool hasAttachments;
  int attachmentsListLength;
  bool hasHashtags;
  int hashtagsListLength;
  bool hasMentions;
  int mentionsListLength;
  bool hasPriority;

  void DecodeFromMap(pubHead) {
    //attachments
    if (pubHead['attachments'] != null) {
      hasAttachments = true;
      // get attachments info
      List<dynamic> attachmentsInfo = pubHead['attachments'];
      var attachmentsInfoLength = attachmentsInfo.length;

      attachments = List<String>(attachmentsInfoLength);
      for (var i = 0; i < attachmentsInfoLength; i++) {
        attachments[i] = attachmentsInfo[i] as String;
      }
    }

    auto = pubHead['auto'];
    forwarded = pubHead['forwarded'];

    //hashtags
    if (pubHead['hashtags'] != null) {
      hasHashtags = true;
      // get hashtags info
      List<dynamic> hashtagsInfo = pubHead['hashtags'];
      var hashtagsInfoLength = hashtagsInfo.length;

      _hashtags = List<String>(hashtagsInfoLength);
      for (var i = 0; i < hashtagsInfoLength; i++) {
        _hashtags[i] = hashtagsInfo[i] as String;
      }
    }

    //mentions
    if (pubHead['mentions'] != null) {
      hasMentions = true;
      // get mentions info
      List<dynamic> mentionsInfo = pubHead['mentions'];
      var mentionsInfoLength = mentionsInfo.length;

      _mentions = List<String>(mentionsInfoLength);
      for (var i = 0; i < mentionsInfoLength; i++) {
        _mentions[i] = mentionsInfo[i] as String;
      }
    }

    mime = pubHead['mime'];

    //priority
    if (pubHead['priority'] != null) {
      hasPriority = true;
      // init priority
      _priority = JPubHeadPriority();
      // mount priority
      _priority.DecodeFromMap(pubHead['priority']);
    }

    replace = pubHead['replace'];
    reply = pubHead['reply'];
    sender = pubHead['sender'];
    thread = pubHead['thread'];
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
      return _hashtags.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  List<String> GetHashtagList() {
    return _hashtags;
  }

  String GetMention(int index) {
    try {
      return _mentions.elementAt(index);
    } catch (e) {
      return null;
    }
  }

  List<String> GetMentionList() {
    return _mentions;
  }

  JPubHeadPriority GetPriority() {
    return _priority;
  }
}
