import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/DataWhat.dart';
import 'package:hampayam_chat/Model/Primitives/DelRange.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Leave.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/MsgClient.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Pub.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Note.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/SendDel.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:provider/provider.dart';

class ChatContent {
  static List<JDelRange> delSeq = List();

  static void sendTextMessage(String topic, String data, String currentUser, BuildContext context) {
    String newId = IORouter.generateRandomKey();
    JSndPub jSndPub = JSndPub(id: newId, topic: topic, noecho: true, content: data);
    MsgClient sendPub = MsgClient(jSndPub: jSndPub);

    IORouter.sendMap(sendPub.toJson());
  }

  static void isTyping(String topic) {
    JSndNote jSndNote = JSndNote(topic: topic, what: 'kp');
    MsgClient sendNote = MsgClient(jSndNote: jSndNote);
    IORouter.sendMap(sendNote.toJson());
  }

  static void readMsg(String topic, int seq) {
    JSndNote jSndNote = JSndNote(topic: topic, what: 'read', seq: seq);
    MsgClient sendNote = MsgClient(jSndNote: jSndNote);
    IORouter.sendMap(sendNote.toJson());
  }

  static void delMessage(String topic, {List<JDelRange> deleteSeq, int start, int last}) {
    String newId = IORouter.generateRandomKey();
    if (start != null) {
      JDelRange delRange = JDelRange(hi: start, low: last);
      delSeq.add(delRange);
    } else if (deleteSeq != null) {
      delSeq = deleteSeq;
    }
    JSndDel del = JSndDel(id: newId, topic: topic, what: 'msg', delSeq: delSeq);
    MsgClient sendDel = MsgClient(jSndDel: del);
    IORouter.sendMap(sendDel.toJson());
  }

  static leaveChat(String topic) {
    JSndLeave jSndLeave = JSndLeave(id: IORouter.generateRandomKey(), topic: topic);
    MsgClient sendLeave = MsgClient(jSndLeave: jSndLeave);
    IORouter.sendMap(sendLeave.toJson());
  }

  static loadMoreData(int before, String topic, int limit) {
    DataWhat dataWhat = DataWhat(before: before, limit: limit);
    JSndGet jSndGet = JSndGet(data: dataWhat, what: 'data', topic: topic, id: IORouter.generateRandomKey());
    MsgClient sendGet = MsgClient(jSndGet: jSndGet);
    IORouter.sendMap(sendGet.toJson());
  }
}
