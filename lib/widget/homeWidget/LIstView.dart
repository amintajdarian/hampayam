import 'package:flutter/widgets.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/statusUserProvider.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatelessWidget {
  final List<JSubscriptionData> chatList;
  final double size;

  ListViewWidget({this.chatList, this.size});
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    StatusUserProvider onlieProvider = Provider.of<StatusUserProvider>(context);

    return Consumer2<ChatListProvider, StatusUserProvider>(builder: (context, value1, value2, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: HampayamClient.chatList(chatList, profileProvider.token, size, value2.getOnlineUser),
          ),
        ),
      );
    });
  }
}
