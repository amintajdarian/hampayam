import 'package:flutter/widgets.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatelessWidget {
  final List<JSubscriptionData> chatList;
  final double size;
  ListViewWidget({this.chatList, this.size});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    return Consumer<ChatListProvider>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 60),
            children: HampayamClient.chatList(chatList, profileProvider.token, size),
          ),
        ),
      );
    });
  }
}
