import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Messenging/GroupSettings.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Messenging/Notification.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Pres.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/statusUserProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/chatButtonProvide.dart';
import 'package:hampayam_chat/widget/chatWidget/ChatAppBar.dart';
import 'package:hampayam_chat/widget/chatWidget/ItemChatList.dart';

import 'package:hampayam_chat/widget/chatWidget/bottomBarWidget.dart';
import 'package:provider/provider.dart';

class P2pChatScreen extends StatefulWidget {
  @override
  State<P2pChatScreen> createState() => _P2pChatScreenState();
}

class _P2pChatScreenState extends State<P2pChatScreen>
    with TickerProviderStateMixin {
  MessageNotifcation notifcation = MessageNotifcation();
  AnimationController _controller;
  Animation _animation;
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  FocusNode _focusNode = FocusNode();
  P2pProvider p2pProvider;
  ProfileProvider profileProvider;
  ChatListProvider chatListProvider;
  ChatButtonProvider buttonProvider;
  StatusUserProvider onlieProvider;
  int max = 0;
  StreamSubscription<MsgType> chatlisten;
  @override
  void initState() {
    notifcation.initializing();
    p2pProvider = Provider.of(context, listen: false);
    profileProvider = Provider.of(context, listen: false);
    chatListProvider = Provider.of(context, listen: false);
    buttonProvider = Provider.of(context, listen: false);
    chatlisten = IORouter.chatScreenChannel.stream.listen(onData);
    if (chatlisten.isPaused) {
      chatlisten.resume();
    }
    if (p2pProvider.getDataSub.topic != null)
      HampayamClient.subToChatFirst(p2pProvider.getDataSub.topic);
    else
      HampayamClient.subToChatFirst(p2pProvider.getDataSub.user);

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    textEditingController.addListener(() {
      if (textEditingController.text.length > 0) {
        buttonProvider.changeTextEnable(true);
        ChatContent.isTyping(p2pProvider.dataSub.topic);
      } else {
        buttonProvider.changeTextEnable(false);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    max = 0;
    chatlisten.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onlieProvider = Provider.of(context);

    var _sizeH = MediaQuery.of(context).size.height;

    // add this

    return WillPopScope(
      onWillPop: () async {
        IORouter.activePage = 'home';
        ChatContent.leaveChat(p2pProvider.dataSub.topic);

        p2pProvider.leaveSub();

        return true;
      },
      child: Scaffold(
        key: _key,
        appBar: p2pProvider.dataSub.public != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(_sizeH / 10),
                child: ChatAppBar(
                  data: p2pProvider.dataSub,
                  height: _sizeH,
                ),
              )
            : null,
        body: Consumer2<P2pProvider, ChatButtonProvider>(
            builder: (context, value1, value2, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: value1.chatList.length,
                      itemBuilder: (context, index) {
                        if (index <= value1.chatList.length - 1 ||
                            value1.chatList.length == 1) {
                          return ItemChatList.chatItem(
                              value1.chatList[index],
                              profileProvider.getUserName,
                              profileProvider.fn +
                                  value1.chatList[index].seq.toString(),
                              value1.dataSub.public.fn,
                              _sizeH,
                              context,
                              profileProvider.getToken);
                        } else if (index > 23) {
                          ChatContent.loadMoreData(value1.chatList[index].seq,
                              value1.dataSub.topic, 24);
                          return Container(
                            child: SpinKitCircle(color: Colors.blue),
                          );
                        }
                      }),
                  flex: 1,
                ),
                BottomBarWidget(
                  size: _sizeH,
                  animation: _animation,
                  controller: _controller,
                  focusNode: _focusNode,
                  textController: textEditingController,
                  buttonProvider: value2,
                  currentUser: profileProvider.getUserName,
                  topic: value1.dataSub.topic,
                  seq: value1.chatList.length > 0
                      ? value1.chatList.last.seq + 1
                      : 1,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> onData(MsgType data) async {
    switch (data.type) {
      case 'd':
        JRcvMsg msg = JRcvMsg.fromJson(data.msg);
        if (max < msg.seq) {
          max = msg.seq;
          ChatContent.readMsg(msg.topic, max);
          chatListProvider.changReadMessage(max, msg.topic);
        }
        if (p2pProvider.getchatList.length > 0) {
          if (msg.seq != p2pProvider.getchatList.last.seq)
            p2pProvider.addMsg(msg);
        } else {
          p2pProvider.addMsg(msg);
        }
        break;
      case 'm':
        JRcvMeta meta = JRcvMeta.fromJson(data.msg);
        if (meta.hasDesc()) {
          p2pProvider.addAcs(meta.desc.acs);
        }

        break;
      case 'p':
        JRcvPres pres = JRcvPres.fromJson(data.msg);
        if (pres.what == 'off') {
          onlieProvider.deleteOnlineUser(pres.src);
        }
        if (pres.what == 'on') {
          if (pres.src.startsWith('usr')) onlieProvider.addOnlineUser(pres.src);
        }

        if (pres.what == 'msg') {
          chatListProvider.changUnreadMessage(pres.seq, pres.src);
          chatListProvider.changLastMessage(
              pres.extra.message, pres.extra.fn, pres.src);
          notifcation.showNotifications(pres.extra.fn, pres.extra.message);
          chatListProvider.chatListChange(pres.src);
        }
        if (pres.what == 'acs') {
          GroupChannelSettings.addTopic(pres.src);
          chatListProvider.addedDataEn(true);
        }

        if (pres.what == 'read') {
          chatListProvider.changReadMessage(pres.seq, pres.src);
        }
        break;
      default:
    }
  }
}
