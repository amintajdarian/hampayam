import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Model/Primitives/DataWhat.dart';
import 'package:hampayam_chat/Model/Primitives/Delete.dart';
import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/Name.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/Subscription.dart';
import 'package:hampayam_chat/Model/Primitives/UserCredential.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Account.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Get.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Hi.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Login.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/MsgClient.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/SendSub.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Set.dart';
import 'package:hampayam_chat/StateManagement/ProfileProvider.dart';

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
    List<JUserCredential> cred = new List();

    JUserCredential credential = JUserCredential(meth: "tel", resp: resp);
    cred.add(credential);
    String newId = IORouter.generateRandomKey();
    JSndLogin login = JSndLogin(id: newId, scheme: 'token', secret: token, cred: cred);
    MsgClient sendLogin = MsgClient(jSndLogin: login);
    IORouter.sendMap(sendLogin.toJson());
  }

  static void validateEmail(String token, String resp) {
    List<JUserCredential> cred = new List();

    JUserCredential credential = JUserCredential(meth: "email", resp: resp);
    cred.add(credential);
    String newId = IORouter.generateRandomKey();
    JSndLogin login = JSndLogin(id: newId, scheme: 'token', secret: token, cred: cred);
    MsgClient sendLogin = MsgClient(jSndLogin: login);
    IORouter.sendMap(sendLogin.toJson());
  }

  static Future<void> saveToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  static Future<void> autoLogin(String address, String apiKey, String userAgent, String language, String verssion) async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token') ?? 'null';
    if (value != 'null') {
      IORouter.connect(' ws://$address/v0/channels?apikey=$apiKey');
      String newId = IORouter.generateRandomKey();
      JSndHi hi = JSndHi(id: newId, lang: language, ua: userAgent, ver: verssion);
      MsgClient sendHi = MsgClient(jSndHi: hi);
      IORouter.sendMap(sendHi.toJson());
      JSndLogin login = JSndLogin(id: newId, scheme: 'token', secret: value);
      MsgClient sendLogin = MsgClient(jSndLogin: login);
      IORouter.sendMap(sendLogin.toJson());
    }
  }

  static void subToMessanger() {
    String newId = IORouter.generateRandomKey();
    JSndGet jSndGet = JSndGet(what: 'sub desc tags cred');
    JSndSub sub = JSndSub(id: newId, topic: 'me', jSndGet: jSndGet);
    MsgClient sendSub = MsgClient(jSndSub: sub);
    IORouter.sendMap(sendSub.toJson());
  }

  static void subToChatFirst(String topic) {
    String newId = IORouter.generateRandomKey();

    Subscription subscription = new Subscription(ims: DateTime.now().toUtc());
    DataWhat data = new DataWhat(limit: 24);
    Description description = new Description(ims: DateTime.now().toUtc());
    JSndGet jSndGet = new JSndGet(data: data, sub: subscription, desc: description, what: 'data sub desc');

    JSndSub jSndSub = JSndSub(id: newId, topic: topic, jSndGet: jSndGet);
    MsgClient sendSub = MsgClient(jSndSub: jSndSub);

    IORouter.sendMap(sendSub.toJson());
  }

  static void subToChat(String topic, String since) {
    String newId = IORouter.generateRandomKey();

    Subscription subscription = new Subscription(ims: DateTime.now().toUtc());
    DataWhat data = new DataWhat(limit: 24);
    Description description = new Description(ims: DateTime.now().toUtc());
    Delete del = Delete(since: since);
    JSndGet jSndGet = new JSndGet(data: data, sub: subscription, desc: description, del: del, what: 'data sub desc');

    JSndSub jSndSub = JSndSub(id: newId, topic: topic, jSndGet: jSndGet);
    MsgClient sendSub = MsgClient(jSndSub: jSndSub);
    IORouter.sendMap(sendSub.toJson());
  }

  static void subToFnd() {
    String newId = IORouter.generateRandomKey();
    JSndGet jSndGet = JSndGet(what: 'sub');
    JSndSub sub = JSndSub(id: newId, topic: 'fnd', jSndGet: jSndGet);
    MsgClient sendSub = MsgClient(jSndSub: sub);
    IORouter.sendMap(sendSub.toJson());
  }

  static void chnageProfileName(String fn, {String surname, Profile profileName}) {
    String newId = IORouter.generateRandomKey();
    JName name = JName(surname: surname);
    JPublicData publicData = JPublicData(fn: fn, n: name);
    Description description = Description(publicData: publicData);
    JSndSet jSndSet = JSndSet(id: newId, topic: 'me', desc: description);
    MsgClient sendSet = MsgClient(jSndSet: jSndSet);
    IORouter.sendMap(sendSet.toJson());
    profileName.setUerName(fn);
  }
}
