import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/widget/homeWidget/LIstView.dart';
import 'package:provider/provider.dart';

class ChannelPage extends StatelessWidget {
  final double size;
  ChannelPage(this.size);

  @override
  Widget build(BuildContext context) {
    ChatListProvider chatListProvider = Provider.of<ChatListProvider>(context);

    return ListViewWidget(
      chatList: chatListProvider.channelList,
      size: size,
    );
  }
}
