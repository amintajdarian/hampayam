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
  static String activePage = 'login';
  static WebsocketManager wsChannel;
  static int msgID = 9999;
  static String connectionStatus;
  static final loginScreenChannel = StreamController<MsgType>.broadcast();
  static final homeScreenChannel = StreamController<MsgType>.broadcast();
  static final chatScreenChannel = StreamController<MsgType>.broadcast();
  static final createScreenChannel = StreamController<MsgType>.broadcast();
  static final signUpScreenChannel = StreamController<MsgType>.broadcast();
  static final shearchScreenChannel = StreamController<MsgType>.broadcast();
  static final String ipAddress = '185.110.189.242:6060';
  static final String apiKey = 'AQAAAAABAADDVmFA9-EU5FyoZh4MWgMT';
  static final String version = '1.0.0';

  static Future<void> connect(String address) async {
    wsChannel = new WebsocketManager(address);

    try {
      print('ok');
    } catch (e) {
      connectionStatus = 'Connection Lost';
      print('disconected');
      await Future.delayed(Duration(minutes: 15))
          .then((value) => connect(address));
    }
    wsChannel.onMessage((event) {
      print(event);
      var serverMsgMap = jsonDecode(event.toString());
      MsgSever msgSever = MsgSever.fromJson(serverMsgMap);
      if (msgSever.msg != null) {
        chatScreenChannel.sink.add(MsgType(serverMsgMap['data'], 'd'));
      } else if (msgSever.ctrl != null) {
        switch (activePage) {
          case 'login':
            loginScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
          case 'home':
            homeScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
          case 'chat':
            chatScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
          case 'signup':
            signUpScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
          case 'search':
            shearchScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
          case 'create':
            createScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));

            break;
        }
        loginScreenChannel.sink.add(MsgType(serverMsgMap['ctrl'], 'c'));
      } else if (msgSever.meta != null) {
        switch (activePage) {
          case 'login':
            loginScreenChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));

            break;
          case 'home':
            homeScreenChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));

            break;
          case 'chat':
            chatScreenChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));

            break;
          case 'signup':
            signUpScreenChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));

            break;
          case 'search':
            shearchScreenChannel.sink.add(MsgType(serverMsgMap['meta'], 'm'));

            break;
        }
      } else if (msgSever.pres != null) {
        switch (activePage) {
          case 'home':
            homeScreenChannel.sink.add(MsgType(serverMsgMap['pres'], 'p'));

            break;
          case 'chat':
            chatScreenChannel.sink.add(MsgType(serverMsgMap['pres'], 'p'));

            break;
        }
      } else if (msgSever.info != null) {
        switch (activePage) {
          case 'home':
            homeScreenChannel.sink.add(MsgType(serverMsgMap['info'], 'i'));

            break;
          case 'chat':
            chatScreenChannel.sink.add(MsgType(serverMsgMap['info'], 'i'));

            break;
        }
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
    print(jsonEncode(msg));
    wsChannel.send(jsonEncode(msg));
  }

  static void sendString(String msg) {
    print(msg);
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
