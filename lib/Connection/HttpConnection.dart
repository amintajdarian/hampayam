import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
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
import 'package:hampayam_chat/StateManagement/CreateChannelProvider/CreateChannelProvider.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/ChlProvder.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/GrpProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class HttpConnection {
  static String setUrl(String address) {
    String url = 'http://$address/v0/file/u/';
    return url;
  }

  static String fileUrl(String address, String fileUrl) {
    String url = 'http://$address$fileUrl';
    return url;
  }

  static Map<String, String> setHeader(String apiKey, String token) {
    var headers = {
      'X-Tinode-APIKey': apiKey,
      'X-Tinode-Auth': 'token $token ',
    };
    return headers;
  }

  static Future<File> compressFile(File file) async {
    File compressedFile = await FlutterNativeImage.compressImage(file.path,
        quality: 50, targetWidth: 600, targetHeight: 300);
    return compressedFile;
  }

  showFile(String uri, dynamic header, String data) async {
    Dio dio = Dio();
    await dio
        .get(fileUrl(IORouter.apiKey, data), queryParameters: header)
        .then((value) {
      print(value);
    });
  }

  static void sendRequestImageChannel(String address, String apiKey,
      String token, File file, BuildContext context,
      {Function onSendProgress, Function onResievedProgress}) async {
    Dio dio = Dio();
    CreateChannelProvider channelProvider = Provider.of(context, listen: false);
    String imageUrl;
    var headers = {"apikey": "$apiKey", "auth": 'token', "secret": "$token"};
    File compressImage;
    String url = setUrl(address);
    await compressFile(file).then((value) => compressImage = value);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(compressImage.path)});
    await dio
        .post(
      url,
      data: formData,
      queryParameters: headers,
    )
        .then((value) {
      if (value.statusCode == 200) {
        MsgSever msgSever = MsgSever.fromJson(value.data);
        imageUrl = (msgSever.ctrl.GetCtrlParamsData().url);
        channelProvider.setImageFile(imageUrl);
      }
    });
  }

  static void sendRequestImageSetting(String address, String apiKey,
      String token, File file, BuildContext context,
      {Function onSendProgress, Function onResievedProgress}) async {
    Dio dio = Dio();
    ProfileProvider profileProvider = Provider.of(context, listen: false);
    String imageUrl;
    var headers = {"apikey": "$apiKey", "auth": 'token', "secret": "$token"};
    File compressImage;
    String url = setUrl(address);
    await compressFile(file).then((value) => compressImage = value);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(compressImage.path)});
    await dio
        .post(
      url,
      data: formData,
      queryParameters: headers,
    )
        .then((value) {
      if (value.statusCode == 200) {
        MsgSever msgSever = MsgSever.fromJson(value.data);
        imageUrl = (msgSever.ctrl.GetCtrlParamsData().url);
        HampayamClient.changeProfilePhoto(
            msgSever.ctrl.GetCtrlParamsData().url);
        profileProvider.setPhoto(imageUrl);
      }
    });
  }

  static void sendRequestImageGrp(String address, String apiKey, String token,
      File file, BuildContext context,
      {Function onSendProgress, Function onResievedProgress}) async {
    Dio dio = Dio();
    CreateGrpProvider grpProvider = Provider.of(context, listen: false);
    String imageUrl;
    var headers = {"apikey": "$apiKey", "auth": 'token', "secret": "$token"};
    File compressImage;
    String url = setUrl(address);
    await compressFile(file).then((value) => compressImage = value);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(compressImage.path)});
    await dio
        .post(
      url,
      data: formData,
      queryParameters: headers,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print(value);
        MsgSever msgSever = MsgSever.fromJson(value.data);
        imageUrl = (msgSever.ctrl.GetCtrlParamsData().url);
        grpProvider.setImageFile(imageUrl);
      }
    });
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

  static sendFile(
      String address,
      String apiKey,
      String token,
      File file,
      String topic,
      Function(int, int) onSendProgress,
      BuildContext context) async {
    Dio dio = Dio();
    P2pProvider p2pProvider;

    GrpProvider grpProvider;

    ChlProvider chlProvider;
    ProfileProvider profileProvider;

    p2pProvider = Provider.of(context, listen: false);
    grpProvider = Provider.of(context, listen: false);
    chlProvider = Provider.of(context, listen: false);
    profileProvider = Provider.of(context, listen: false);

    var headers = {"apikey": "$apiKey", "auth": 'token', "secret": "$token"};

    await compressFile(file).then((value) => file = value);

    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});

    String url = setUrl(address);

    await dio
        .post(url,
            data: formData,
            queryParameters: headers,
            onSendProgress: onSendProgress)
        .then((value) {
      if (value.statusCode == 200) {
        MsgSever msgSever = MsgSever.fromJson(value.data);
        String fileUrl = (msgSever.ctrl.GetCtrlParamsData().url);

        List<JTextFormat> format;
        List<JTextEntity> entity;
        JPubHead head;
        JPubContent content;
        JTextEntityData data;
        JSndPub pub;
        MsgClient sendPub;
        final mimeType = lookupMimeType(file.path);
        String basename = p.basename(file.path);

        String newId = IORouter.generateRandomKey();
        if (mimeType.startsWith('image/')) {
          format = [JTextFormat(len: 1)];
          data = JTextEntityData(mime: mimeType, val: fileUrl, name: basename);
          entity = [JTextEntity(tp: 'IM', data: data)];
          content = JPubContent(ent: entity, fmt: format);
          head = JPubHead(mime: "text/x-drafty");
          pub = JSndPub(
              id: newId,
              topic: topic,
              noecho: true,
              head: head,
              content: content.toJson());
          sendPub = MsgClient(jSndPub: pub);
          IORouter.sendMap(sendPub.toJson());
          if (topic.startsWith('usr')) {
            JRcvMsg rcvMsg = JRcvMsg(
                content: content.toJson(),
                head: head,
                from: profileProvider.getUserName,
                seq: ++p2pProvider.getchatList.first.seq,
                topic: topic,
                ts: DateTime.now().toUtc().toString());
            p2pProvider.inserMsg(rcvMsg);
          }
          if (topic.startsWith('grp')) {
            JRcvMsg rcvMsg = JRcvMsg(
                content: content.toJson(),
                head: head,
                from: profileProvider.getUserName,
                seq: p2pProvider.getchatList.first.seq++,
                topic: topic,
                ts: DateTime.now().toUtc().toString());
            grpProvider.inserstMsg(rcvMsg);
          }
          if (topic.startsWith('chl')) {
            JRcvMsg rcvMsg = JRcvMsg(
                content: content,
                head: head,
                from: profileProvider.getUserName,
                seq: p2pProvider.getchatList.first.seq++,
                topic: topic,
                ts: DateTime.now().toUtc().toString());
            chlProvider.inserstMsg(rcvMsg);
          }
        } else {
          format = [JTextFormat(at: -1)];
          data = JTextEntityData(mime: mimeType, val: fileUrl, name: basename);
          entity = [JTextEntity(tp: 'EX', data: data)];
          content = JPubContent(ent: entity as List, fmt: format as List);
          head = JPubHead(mime: "text/x-drafty");
          pub = JSndPub(
              id: newId,
              topic: topic,
              noecho: true,
              head: head,
              content: content);
          sendPub = MsgClient(jSndPub: pub);
          IORouter.sendMap(sendPub.toJson());
        }
      }
    });
  }
}
