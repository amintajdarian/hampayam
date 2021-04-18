import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgsServer.dart';
import 'package:web_socket_channel/io.dart';

class MsgType {
  Map<String, dynamic> msg;
  String type;
  MsgType(Map<String, dynamic> msg, String type) {
    this.msg = msg;
    this.type = type;
  }
}

class IORouter {
  static IOWebSocketChannel wsChannel;
  static int msgID = 9999;
  static String connectionStatus;
  static final chatChannel = StreamController<MsgType>.broadcast();

  static void connect(String address) {
    try {
      wsChannel = IOWebSocketChannel.connect(address);
      connectionStatus = 'Connect Successfull';
    } catch (e) {
      connectionStatus = 'Connection Lost';
    }
    wsChannel.stream.listen((event) {
      var serverMsgMap = jsonDecode(event.toString());
      MsgSever msgSever = MsgSever.fromJson(serverMsgMap);
      if (msgSever.msg != null) {
        chatChannel.sink.add(MsgType(serverMsgMap['data'], 'd'));
      } else if (msgSever.ctrl != null) {
        chatChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));
      } else if (msgSever.meta != null) {
        chatChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));
      } else if (msgSever.pres != null) {
        chatChannel.sink.add(MsgType(serverMsgMap['pres'], 'p'));
      } else if (msgSever.info != null) {
        chatChannel.sink.add(MsgType(serverMsgMap['info'], 'i'));
      }
    });
  }

  static String generateRandomKey() {
    return (Random().nextInt(90000) + 10000 - 1).toString();
  }

  static void sendMap(Map<String, dynamic> msg) {
    wsChannel.sink.add(jsonEncode(msg));
  }

  static void sendString(String msg) {
    wsChannel.sink.add(msg);
  }

  static String base4dEncod(String input) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(input);
  }

  static String getMsgId() {
    msgID++;
    return msgID.toString();
  }
}
