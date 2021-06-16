import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/widget/homeWidget/LIstView.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final double size;
  UserPage(this.size);

  @override
  Widget build(BuildContext context) {
    ChatListProvider chatListProvider = Provider.of<ChatListProvider>(context);

    return ListViewWidget(
      chatList: chatListProvider.userList,
      size: size,
    );
  }
}
