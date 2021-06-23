import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
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

class _P2pChatScreenState extends State<P2pChatScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  FocusNode _focusNode = FocusNode();
  P2pProvider p2pProvider;
  ProfileProvider profileProvider;
  ChatListProvider chatListProvider;
  ChatButtonProvider buttonProvider;
  int max = 0;
  StreamSubscription<MsgType> chatlisten;
  @override
  void initState() {
    p2pProvider = Provider.of(context, listen: false);
    profileProvider = Provider.of(context, listen: false);
    chatListProvider = Provider.of(context, listen: false);
    buttonProvider = Provider.of(context, listen: false);
    chatlisten = IORouter.chatScreenChannel.stream.listen(onData);
    if (chatlisten.isPaused) {
      chatlisten.resume();
    }

    HampayamClient.subToChatFirst(p2pProvider.getDataSub.topic);

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
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
        appBar: p2pProvider.dataSub != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(_sizeH / 10),
                child: ChatAppBar(
                  data: p2pProvider.dataSub,
                  height: _sizeH,
                ),
              )
            : null,
        body: Consumer2<P2pProvider, ChatButtonProvider>(builder: (context, value1, value2, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: value1.chatList.length,
                      itemBuilder: (context, index) {
                        if (index != value1.chatList.length - 1) {
                          return ItemChatList.chatItem(value1.chatList[index], profileProvider.getUserName, profileProvider.fn + value1.chatList[index].seq.toString(), value1.dataSub.public.fn,
                              _sizeH, context, profileProvider.getToken);
                        } else if (value1.chatList.last.seq != 1) {
                          ChatContent.loadMoreData(value1.chatList[index].seq, value1.dataSub.topic, 24);
                          return Container(
                            child: SpinKitCircle(color: Colors.blue),
                          );
                        } else if (index != 0) {
                          return ItemChatList.chatItem(value1.chatList[index], profileProvider.getUserName, profileProvider.fn + value1.chatList[index].seq.toString(), value1.dataSub.public.fn,
                              _sizeH, context, profileProvider.getToken);
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
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> onData(MsgType data) async {
    print(data.msg);
    switch (data.type) {
      case 'd':
        JRcvMsg msg = JRcvMsg.fromJson(data.msg);
        if (max < msg.seq) {
          max = msg.seq;
          ChatContent.readMsg(msg.topic, max);
          chatListProvider.changReadMessage(max, msg.topic);
        }

        p2pProvider.addMsg(msg);

        break;
      case 'm':
        JRcvMeta meta = JRcvMeta.fromJson(data.msg);

        print(meta);

        break;
      default:
    }
  }
}
