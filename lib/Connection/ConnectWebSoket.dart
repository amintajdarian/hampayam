import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgsServer.dart';
import 'package:websocket_manager/websocket_manager.dart';

class MsgType {
  Map<String, dynamic> msg;
  String type;
  MsgType(Map<String, dynamic> msg, String type) {
    this.msg = msg;
    this.type = type;
  }
}

class IORouter {
  static WebsocketManager wsChannel;
  static int msgID = 9999;
  static String connectionStatus;
  static final chatChannel = StreamController<MsgType>.broadcast();
  static final String ipAddress = '185.110.189.242:6060';
  static final String apiKey = 'AQAAAAABAADDVmFA9-EU5FyoZh4MWgMT';

  static Future<void> connect(String address) async {
    wsChannel = WebsocketManager(address);

    // wsChannel = IOWebSocketChannel.connect(address);
    try {
      print('ok');
    } catch (e) {
      connectionStatus = 'Connection Lost';
      print('disconected');
      await Future.delayed(Duration(minutes: 15)).then((value) => connect(address));
    }
    wsChannel.onMessage((event) {
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
    wsChannel.connect();
  }

  static void closeConnection() {
    wsChannel.close();
  }

  static String generateRandomKey() {
    return (Random().nextInt(90000) + 10000 - 1).toString();
  }

  static void sendMap(Map<String, dynamic> msg) {
    print(msg);
    wsChannel.send(jsonEncode(msg));
  }

  static void sendString(String msg) {
    wsChannel.send(msg);
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
