import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Account.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Hi.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Login.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/MsgClient.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/SendSub.dart';

class HampayamClient {
  static void loginChat(String address, String apiKey, String userAgent, String language, String verssion, String username, String password) {
    IORouter.connect('ws://$address/v0/channels?apikey=$apiKey');

    String newId = IORouter.generateRandomKey();
    JSndHi hi = JSndHi(id: newId, lang: language, ua: userAgent, ver: verssion);
    MsgClient sendHi = MsgClient(jSndHi: hi);
    IORouter.sendMap(sendHi.toJson());
    String secret = IORouter.base4dEncod(username + ':' + password);
    JSndLogin login = JSndLogin(id: newId, scheme: 'basic', secret: secret);
    MsgClient sendLogin = MsgClient(jSndLogin: login);
    IORouter.sendMap(sendLogin.toJson());
    JSndGet jSndGet = JSndGet(what: 'sub desc tags cred');
    JSndSub sub = JSndSub(id: newId, topic: 'me', jSndGet: jSndGet);
    MsgClient sendSub = MsgClient(jSndSub: sub);
    IORouter.sendMap(sendSub.toJson());
  }

  static void signUpChatWithPhone(String address, String apiKey, String userAgent, String language, String verssion, String name, String phone, String username, String password) {
    IORouter.connect(' ws://$address/v0/channels?apikey=$apiKey');

    String newId = IORouter.generateRandomKey();
    JSndHi hi = JSndHi(id: newId, lang: language, ua: userAgent, ver: verssion);
    MsgClient sendHi = MsgClient(jSndHi: hi);
    IORouter.sendMap(sendHi.toJson());
    String secret = IORouter.base4dEncod(username + ':' + password);
    JPublicData public;
    JPublicData(fn: name);
    Description description = Description(publicData: public);
    JUserCredential credential = JUserCredential(meth: "tel", val: phone);
    JSndAcc acc = JSndAcc(id: newId, user: 'new', scheme: 'basic', secret: secret, login: true, desc: description, cred: credential as List);
    MsgClient sendAcc = MsgClient(jSndAcc: acc);
    IORouter.sendMap(sendAcc.toJson());
  }

  static void signUpChatWithEmail(String address, String apiKey, String userAgent, String language, String verssion, String name, String email, String username, String password) {
    IORouter.connect(' ws://$address/v0/channels?apikey=$apiKey');
    String newId = IORouter.generateRandomKey();
    JSndHi hi = JSndHi(id: newId, lang: language, ua: userAgent, ver: verssion);
    MsgClient sendHi = MsgClient(jSndHi: hi);
    IORouter.sendMap(sendHi.toJson());
    String secret = IORouter.base4dEncod(username + ':' + password);
    JPublicData public;
    JPublicData(fn: name);
    Description description = Description(publicData: public);
    JUserCredential credential = JUserCredential(meth: "email", val: email);
    JSndAcc acc = JSndAcc(id: newId, user: 'new', scheme: 'basic', secret: secret, login: true, desc: description, cred: credential as List);
    MsgClient sendAcc = MsgClient(jSndAcc: acc);
    IORouter.sendMap(sendAcc.toJson());
  }

  static void validateNumber(String token, String resp) {
    JUserCredential credential = JUserCredential(meth: "tel", resp: resp);
    String newId = IORouter.generateRandomKey();
    JSndLogin login = JSndLogin(id: newId, scheme: 'token', secret: token, cred: credential as List);
    MsgClient sendLogin = MsgClient(jSndLogin: login);
    IORouter.sendMap(sendLogin.toJson());
  }

  static void validateEmail(String token, String resp) {
    JUserCredential credential = JUserCredential(meth: "email", resp: resp);
    String newId = IORouter.generateRandomKey();
    JSndLogin login = JSndLogin(id: newId, scheme: 'token', secret: token, cred: credential as List);
  }

  static Future<void> saveToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  static autoLogin() {}
}
