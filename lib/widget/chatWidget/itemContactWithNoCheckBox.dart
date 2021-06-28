import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/Screen/chatScreen/P2pChat/P2pChatScreen.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:provider/provider.dart';

class ItemContactNCH {
  static List<Widget> listOfContact(List<JSubscriptionData> subList,
      double size, BuildContext context, String token) {
    P2pProvider p2pProvider = Provider.of(context, listen: false);
    ChatListProvider chatListProvider = Provider.of(context, listen: false);

    List<Widget> listItem = [];
    if (subList != null) {
      for (var item in subList) {
        String subName = item.public.fn.substring(0, 2);
        listItem.add(Card(
            child: Padding(
          padding: EdgeInsets.all(size / 200),
          child: ListTile(
            onTap: () {
              int counter = 0;
              int index = 0;
              for (int i = 0; i < chatListProvider.getUSerList.length; i++) {
                if (chatListProvider.getUSerList[i].user != null) {
                  if (chatListProvider.getUSerList[i].user == item.user) {
                    counter++;
                    index = i;
                  }
                } else if (chatListProvider.getUSerList[i].topic != null) {
                  if (chatListProvider.getUSerList[i].topic == item.user) {
                    counter++;
                    index = i;
                  }
                }
              }
              if (counter == 0) {
                item.touched = DateTime.now().toUtc();
                item.updated = DateTime.now().toUtc();
                chatListProvider.addSubListByUser(item);
                p2pProvider.addSub(item);
              } else {
                p2pProvider.addSub(chatListProvider.getUSerList[index]);
              }

              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => P2pChatScreen(),
                ),
              );
            },
            title: Text(item.public.fn),
            subtitle: Text(item.private[0]),
            leading: item.public.photo != null
                ? CachedNetworkImage(
                    imageUrl: HttpConnection.fileUrl(
                        IORouter.ipAddress, item.public.photo.data),
                    httpHeaders:
                        HttpConnection.setHeader(IORouter.apiKey, token),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    imageBuilder: (context, imageProvider) => Container(
                      width: size / 15,
                      height: size / 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: size / 30,
                    child: Text(
                      subName,
                    ),
                  ),
          ),
        )));
      }
    }
    if (listItem.length < 0) {
      listItem.add(Text('No Contact Exist'));
    }
    return listItem;
  }
}
