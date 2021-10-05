import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/widget/chatWidget/chatModeWidget/ReceivesMessgeWidget.dart';
import 'package:hampayam_chat/widget/chatWidget/chatModeWidget/SendMessageWidget.dart';

class ItemChatList extends StatelessWidget {
  JRcvMsg item;
  String currentUser;
  String currentUserName;
  String userName;
  double size;
  BuildContext context;
  String token;
  ItemChatList(this.item, this.currentUser, this.currentUserName, this.userName,
      this.size, this.context, this.token);
  @override
  Widget build(BuildContext context) {
    if (item.from == currentUser) {
      return SendMsg.sendMsgMode(size, item, currentUserName, context, token);
    } else {
      return ReceivesMsg.rcvMsgMode(size, item, userName, context, token);
    }
  }
}
