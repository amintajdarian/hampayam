import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/Screen/HomeScreen.dart';
import 'package:hampayam_chat/Screen/chatScreen/ChlChat/ChlChatScreen.dart';
import 'package:hampayam_chat/Screen/chatScreen/P2pChat/P2pChatScreen.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/ChlProvder.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:provider/provider.dart';

class ListViewItem {
  static List<Widget> chatList(List<JSubscriptionData> subList, String token, double size, List online, BuildContext context) {
    List<Widget> subChats = [];
    P2pProvider p2pProvider = Provider.of(context);
    ChlProvider chlProvider = Provider.of(context);
    for (var item in subList) {
      String subName = item.public.fn.substring(0, 2);
      subChats.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            IORouter.activePage = 'chat';

            if (item.topic.startsWith('usr')) {
              p2pProvider.addSub(item);
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => P2pChatScreen(),
                ),
              );
            } else if (item.topic.startsWith('chl')) {
              chlProvider.addTopicSub(item);
              chlProvider.changeShowButton(item.acs.mode.isWrite);
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ChlChatScreen(),
                ),
              );
            }
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(size / 200),
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
                    ? Stack(children: [
                        CachedNetworkImage(
                          imageUrl: HttpConnection.fileUrl(IORouter.ipAddress, item.public.photo.data),
                          httpHeaders: HttpConnection.setHeader(IORouter.apiKey, token),
                          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                          imageBuilder: (context, imageProvider) => Container(
                            width: size / 15,
                            height: size / 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: online.contains(item.topic) ? true : false,
                          child: new Positioned(
                            bottom: 1,
                            left: 1,
                            child: new Icon(Icons.brightness_1, size: 20, color: Colors.green),
                          ),
                        )
                      ])
                    : Stack(
                        children: [
                          CircleAvatar(
                            radius: size / 30,
                            child: Text(
                              subName,
                            ),
                          ),
                          Visibility(
                            visible: online.contains(item.topic) ? true : false,
                            child: new Positioned(
                              bottom: 1,
                              left: 1,
                              child: new Icon(Icons.brightness_1, size: 20, color: Colors.green),
                            ),
                          )
                        ],
                      ),
                trailing: Text(item.seq != null
                    ? item.read != null
                        ? (item.seq - item.read) != 0
                            ? (item.seq - item.read).toString()
                            : ''
                        : ''
                    : ''),
              ),
            ),
          ),
        ),
      ));
    }
    return subChats;
  }
}
