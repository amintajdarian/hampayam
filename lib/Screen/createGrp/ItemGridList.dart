import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:provider/provider.dart';

class ItemGrid {
  static List<Widget> itemAdded(
      List<JSubscriptionData> items, BuildContext context, double size) {
    ProfileProvider profileProvider = Provider.of(context);
    List<Widget> tempList = [];
    for (var item in items) {
      tempList.add(
        Column(
          children: [
            item.public.photo != null
                ? Column(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        foregroundImage: Image(
                            image: CachedNetworkImageProvider(
                          HttpConnection.fileUrl(
                              IORouter.ipAddress, item.public.photo.data),
                          headers: HttpConnection.setHeader(
                              IORouter.apiKey, profileProvider.getToken),
                        )).image,
                      ),
                      Text(
                        item.public.fn,
                        style: TextStyle(fontSize: size / 50),
                      )
                    ],
                  )
                : Column(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        child: Icon(
                          Elusive.child,
                          size: 55,
                        ),
                      ),
                      Text(item.public.fn)
                    ],
                  ),
          ],
        ),
      );
    }
    return tempList;
  }
}
