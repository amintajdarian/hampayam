import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
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
import 'package:device_info/device_info.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:provider/provider.dart';

class HampayamClient {
  static Future<void> loginChat(String address, String apiKey, String language, String username, String password) async {
    IORouter.connect('ws://$address/v0/channels?apikey=$apiKey');
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    String newId = IORouter.generateRandomKey();
    JSndHi hi = JSndHi(id: newId, lang: language, ua: androidInfo.version.release, ver: IORouter.version);
    MsgClient sendHi = MsgClient(jSndHi: hi);
    IORouter.sendMap(sendHi.toJson());
    String secret = IORouter.base4dEncod(username + ':' + password);
    JSndLogin login = JSndLogin(id: newId, scheme: 'basic', secret: secret);
    MsgClient sendLogin = MsgClient(jSndLogin: login);
    IORouter.sendMap(sendLogin.toJson());
  }

  static Future<void> signUpChatWithPhone(String address, String apiKey, String language, String name, String phone, String username, String password) async {
    IORouter.connect(' ws://$address/v0/channels?apikey=$apiKey');
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String newId = IORouter.generateRandomKey();
    JSndHi hi = JSndHi(id: newId, lang: language, ua: androidInfo.version.release, ver: IORouter.version);
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

  static Widget showImage(String item, String token, Widget dataAvatar, double size) {
    if (item != null) {
      return CachedNetworkImage(
        imageUrl: HttpConnection.fileUrl(IORouter.ipAddress, item),
        httpHeaders: HttpConnection.setHeader(IORouter.apiKey, token),
        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
        imageBuilder: (context, imageProvider) => Container(
          width: size / 20,
          height: size / 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 35,
        child: dataAvatar,
      );
    }
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

  static Future<void> autoLogin(String address, String apiKey, String language, String value) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    IORouter.connect('ws://$address/v0/channels?apikey=$apiKey');

    if (value != null) {
      String newId = IORouter.generateRandomKey();
      JSndHi hi = JSndHi(id: newId, lang: language, ua: androidInfo.version.release, ver: IORouter.version);
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

  static void contactSearch(String contactList) {
    if (contactList.length > 0) {
      IORouter.sendString('{"set":{"id":"95589","topic":"fnd","desc":{"public":"tel:$contactList"}}}');
      JSndGet jSndGet = JSndGet(id: IORouter.generateRandomKey(), topic: 'fnd', what: 'sub');
      MsgClient sendGet = MsgClient(jSndGet: jSndGet);
      IORouter.sendMap(sendGet.toJson());
    }
  }

  static void getContatct() async {
    List<Contact> contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();
    String contacString = '';
    int counter = 0;
    List<String> phone = [];
    if (contacts != null) {
      for (var item in contacts) {
        if (item.phones.toList().length > 0) {
          if (!phone.contains(item.phones.toList().elementAt(0).value)) {
            phone.add(item.phones.toList().first.value.replaceAll(new RegExp(r"\s+"), ""));
          }
        }
      }

      for (var item in phone) {
        if (item.length > 10) {
          if (item.startsWith('+')) {
            if (counter == 0)
              contacString += '0' + item.substring(item.length - 10) + ',';
            else
              contacString += 'tel:' + '0' + item.substring(item.length - 10) + ',';
          } else if (item.startsWith('0')) {
            if (counter == 0)
              contacString += item.substring(item.length - 10) + ',';
            else
              contacString += 'tel:' + '0' + item.substring(item.length - 10) + ',';
          }
          if (contacString.length > 0) {
            counter++;
          }
        }
      }

      HampayamClient.contactSearch(contacString);
    }
  }

  static void chnageProfileName(String fn, {String surname, ProfileProvider profileName}) {
    String newId = IORouter.generateRandomKey();
    JName name = JName(surname: surname);
    JPublicData publicData = JPublicData(fn: fn, n: name);
    Description description = Description(publicData: publicData);
    JSndSet jSndSet = JSndSet(id: newId, topic: 'me', desc: description);
    MsgClient sendSet = MsgClient(jSndSet: jSndSet);
    IORouter.sendMap(sendSet.toJson());
    profileName.setUerName(fn);
  }

  static void getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      HampayamClient.getContatct();
    }
  }

  static Future<void> getDataAutoLogin(BuildContext context, String language) async {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    ChatListProvider chatListProvider = Provider.of<ChatListProvider>(context, listen: false);

    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token') ?? null;
    if (profileProvider.token == '') {
      await HampayamClient.autoLogin(IORouter.ipAddress, IORouter.apiKey, language, value);
      IORouter.homeScreenChannel.stream.listen((event) async {
        switch (event.type) {
          case 'm':
            JRcvMeta meta = JRcvMeta.fromJson(event.msg);
            print(event.msg);
            if (meta.hasSub()) {
              if (meta.topic == 'me') {
                chatListProvider.clearData();
                meta.sub.sort((a, b) => b.touched.compareTo(a.touched));
                chatListProvider.listSpliter(meta.sub);
              }
            }
            if (meta.hasDesc()) {
              profileProvider.fname(meta.getDescription().getPublic().fn);
              if (meta.getDescription().getPublic().photo != null) {
                if (meta.getDescription().getPublic().photo != null) {
                  profileProvider.setPhoto(meta.getDescription().getPublic().photo.data);
                }
              }
              if (meta.desc.getPublic().n != null) {
                profileProvider.sname(meta.getDescription().getPublic().n.surname);
              }
            }
            if (meta.hasCred()) {
              profileProvider.setPhone(meta.getCredential(0).val);
            }

            break;
          case 'c':
            JRcvCtrl ctrl = JRcvCtrl.fromJson(event.msg);

            if (ctrl.code == 200 && ctrl.params != null) {
              if (ctrl.params.token != null) {
                profileProvider.setToken(ctrl.params.token);
                HampayamClient.saveToken(ctrl.params.token);
                HampayamClient.subToMessanger();

                profileProvider.setUerName(ctrl.params.user);
              }
            }
            break;
          default:
        }
      });
    }
  }

  static Future getImagefromcamera(BuildContext context) async {
    CreateGrpProvider createGrpProvider = Provider.of(context, listen: false);
    ProfileProvider profileProvider = Provider.of(context, listen: false);
    var image = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image != null) {
      await HttpConnection.sendRequestImageGrp(
        IORouter.ipAddress,
        IORouter.apiKey,
        profileProvider.getToken,
        File(image.path),
      ).then((value) => createGrpProvider.setImageFile(value));
    }
  }

  static Future getImagefromGallery(BuildContext context) async {
    CreateGrpProvider createGrpProvider = Provider.of(context, listen: false);
    ProfileProvider profileProvider = Provider.of(context, listen: false);

    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await HttpConnection.sendRequestImageGrp(
        IORouter.ipAddress,
        IORouter.apiKey,
        profileProvider.getToken,
        File(image.path),
      ).then((value) => createGrpProvider.setImageFile(value));
    }
  }
}
