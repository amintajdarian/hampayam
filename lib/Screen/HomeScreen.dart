import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/widget/homeWidget/ShapeBorder.dart';
import 'package:hampayam_chat/widget/homeWidget/botomBar.dart';
import 'package:hampayam_chat/widget/homeWidget/endDrawer.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> chatList(List<JSubscriptionData> subList, String token, double size) {
    List<Widget> subChats = [];
    for (var item in subList) {
      String subName = item.public.fn.substring(0, 3);
      subChats.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: ListTile(
            title: Text(
              item.public.fn,
            ),
            subtitle: item.lastMessage != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.lastMessage.fn + ' :' + (item.lastMessage.message.runtimeType == String ? item.lastMessage.message.toString() : 'data'),
                    ),
                  )
                : null,
            leading: item.public.photo != null
                ? CachedNetworkImage(
                    imageUrl: HttpConnection.fileUrl(IORouter.ipAddress, item.public.photo.data),
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
                  )
                : CircleAvatar(
                    radius: 35,
                    child: Text(
                      subName,
                    ),
                  ),
            trailing: Icon(Icons.star),
          ),
        ),
      ));
    }
    return subChats;
  }

  @override
  Widget build(BuildContext context) {
    ChatListProvider chatListProvider = Provider.of<ChatListProvider>(context);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    var _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                LocaleKeys.Messanger.tr(),
                style: TextStyle(fontSize: _sizeH / 30),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: _sizeH / 40,
                  )),
            ),
          ],
        ),
        elevation: _sizeH / 60,
        toolbarHeight: _sizeH / 10,
        shape: MyShapeBorder(_sizeH / 20),
      ),
      endDrawer: MyDrawer(),
      body: Consumer<ChatListProvider>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(top: 60),
              children: chatList(chatListProvider.getSubList, profileProvider.token, _sizeH),
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomBar(_sizeH),
    );
  }
}
