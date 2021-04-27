import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgsServer.dart';
import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/Photo.dart';
import 'package:hampayam_chat/Model/Primitives/PubContent.dart';
import 'package:hampayam_chat/Model/Primitives/PubHead.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/TextEntity.dart';
import 'package:hampayam_chat/Model/Primitives/TextEntityData.dart';
import 'package:hampayam_chat/Model/Primitives/TextFormat.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/MsgClient.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Pub.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Set.dart';
import 'package:hampayam_chat/StateManagement/ProfileProvider.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';

class HttpConnection {
  static String setUrl(String address) {
    String url = 'http://$address/v0/file/u/';
    return url;
  }

  static Map<String, String> setHeader(String apiKey, String token) {
    var headers = {
      'apikey': apiKey,
      'auth': 'token',
      'secret': token,
    };
    return headers;
  }

  Future<File> compressFile(File file) async {
    File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: 50, targetWidth: 600, targetHeight: 300);
    return compressedFile;
  }

  static sendRequest(String url, Map<String, String> headers, String topic, File file, Function run(File file, String topic, JRcvCtrl ctrl),
      {Function onSendProgress, Function onResievedProgress}) async {
    Dio dio = Dio();
    FormData formData = FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});
    await dio
        .post(
      url,
      data: formData,
      queryParameters: headers,
      onSendProgress: onSendProgress,
    )
        .then((value) {
      if (value.statusCode == 200) {
        MsgSever msgSever = MsgSever.fromJson(value.data);
        run(file, topic, msgSever.ctrl);
      }
    });
  }

  setImageProfile(String address, String apiKey, String token, File file, Profile profile) async {
    var url = setUrl(address);
    var headers = setHeader(apiKey, token);

    await compressFile(file).then((value) async {
      await sendRequest(url, headers, 'me', value, (file, topic, ctrl) => setImage(file, topic, ctrl));
      profile.setPhoto(file);
    });
  }

  Future<File> showImage(String address, String apiKey, String token) async {
    var url = setUrl(address);
    var headers = setHeader(apiKey, token);
    var file = await DefaultCacheManager().getSingleFile(url, headers: headers);
    return file;
  }

  sendFileToChat(String address, String apiKey, String token, File file, String topic, Function onprogress, {String text}) async {
    String url = setUrl(address);
    var headers = setHeader(apiKey, token);
    await sendRequest(url, headers, topic, file, (file, topic, ctrl) => sendFile(file, topic, ctrl));
  }

  setImage(File file, String topic, JRcvCtrl ctrl) {
    String newId = IORouter.generateRandomKey();
    JPhoto photo = JPhoto(data: ctrl.params.url, type: 'jpg');
    JPublicData publicData = JPublicData(photo: photo);
    Description description = Description(publicData: publicData);
    JSndSet jSndSet = JSndSet(id: newId, topic: topic, desc: description);
    MsgClient sendSet = MsgClient(jSndSet: jSndSet);
    IORouter.sendMap(sendSet.toJson());
  }

  sendFile(File file, String topic, JRcvCtrl ctrl) {
    final mimeType = lookupMimeType(file.path);
    String basename = p.basename(file.path);

    String fileUrl = ctrl.params.url;
    JTextFormat format;
    JTextEntity entity;
    JPubHead head;
    JPubContent content;
    JTextEntityData data;
    JSndPub pub;
    MsgClient sendPub;

    String newId = IORouter.generateRandomKey();
    if (mimeType.startsWith('image/')) {
      format = JTextFormat(len: 1);
      data = JTextEntityData(mime: mimeType, val: fileUrl, name: basename);
      entity = JTextEntity(tp: 'IM', data: data);
      content = JPubContent(ent: entity as List, fmt: format as List);
      head = JPubHead(mime: "text/x-drafty");
      pub = JSndPub(id: newId, topic: topic, noecho: true, head: head, content: content);
      sendPub = MsgClient(jSndPub: pub);
      IORouter.sendMap(sendPub.toJson());
    } else {
      format = JTextFormat(at: -1);
      data = JTextEntityData(mime: mimeType, val: fileUrl, name: basename);
      entity = JTextEntity(tp: 'EX', data: data);
      content = JPubContent(ent: entity as List, fmt: format as List);
      head = JPubHead(mime: "text/x-drafty");
      pub = JSndPub(id: newId, topic: topic, noecho: true, head: head, content: content);
      sendPub = MsgClient(jSndPub: pub);
      IORouter.sendMap(sendPub.toJson());
    }
  }
}
