import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Messenging/GroupSettings.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Messenging/Notification.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Pres.dart';
import 'package:hampayam_chat/Screen/HomeScreen.dart';
import 'package:hampayam_chat/StateManagement/CreateChannelProvider/CreateChannelProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/statusUserProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/AddMemberProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/ChlProvder.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/chatButtonProvide.dart';
import 'package:hampayam_chat/widget/Loading.dart';
import 'package:hampayam_chat/widget/chatWidget/ChatAppBar.dart';
import 'package:hampayam_chat/widget/chatWidget/ItemChatList.dart';

import 'package:hampayam_chat/widget/chatWidget/bottomBarWidget.dart';
import 'package:provider/provider.dart';

class ChlChatScreen extends StatefulWidget {
  @override
  State<ChlChatScreen> createState() => _ChlChatScreenState();
}

class _ChlChatScreenState extends State<ChlChatScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  AddMemberProvider addMemberProvider;
  FocusNode _focusNode = FocusNode();
  CreateChannelProvider channelProvider;
  ProfileProvider profileProvider;
  ChatListProvider chatListProvider;
  StatusUserProvider onlieProvider;
  MessageNotifcation notifcation = MessageNotifcation();
  ChlProvider chlProvider;
  ChatButtonProvider buttonProvider;
  int max = 0;
  StreamSubscription<MsgType> chatlisten;
  @override
  void initState() {
    channelProvider = Provider.of(context, listen: false);
    profileProvider = Provider.of(context, listen: false);
    chatListProvider = Provider.of(context, listen: false);
    buttonProvider = Provider.of(context, listen: false);
    chlProvider = Provider.of(context, listen: false);
    addMemberProvider = Provider.of(context, listen: false);
    onlieProvider = Provider.of(context, listen: false);
    notifcation.initializing();
    chatlisten = IORouter.chatScreenChannel.stream.listen(onData);
    if (chatlisten.isPaused) {
      chatlisten.resume();
    }
    if (!channelProvider.getCreated) {
      HampayamClient.subToChatFirst(chlProvider.getTopicData.topic);
    }

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
    return WillPopScope(
      onWillPop: () async {
        IORouter.activePage = 'home';
        ChatContent.leaveChat(chlProvider.topicData.topic);
        chlProvider.leaveSub();
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );

        return true;
      },
      child: Consumer2<CreateChannelProvider, ChlProvider>(
          builder: (context, value, value1, child) {
        if (!channelProvider.getCreated) {
          return Scaffold(
            key: _key,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(_sizeH / 10),
              child: chlProvider.getTopicData.public != null
                  ? ChatAppBar(
                      data: chlProvider.getTopicData,
                      height: _sizeH,
                    )
                  : Container(),
            ),
            body:
                Consumer<ChatButtonProvider>(builder: (context, value2, child) {
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
                              return ItemChatList(
                                  value1.chatList[index],
                                  profileProvider.getUserName,
                                  profileProvider.fn +
                                      value1.chatList[index].seq.toString(),
                                  value1.getTopicData.public.fn,
                                  _sizeH,
                                  context,
                                  profileProvider.getToken);
                            } else if (index >= 23) {
                              ChatContent.loadMoreData(
                                  value1.chatList[index].seq,
                                  value1.topicData.topic,
                                  24);
                              return Container(
                                child: SpinKitCircle(color: Colors.blue),
                              );
                            }
                          }),
                      flex: 1,
                    ),
                    (value1.getShowButton)
                        ? BottomBarWidget(
                            size: _sizeH,
                            animation: _animation,
                            controller: _controller,
                            focusNode: _focusNode,
                            textController: textEditingController,
                            buttonProvider: value2,
                            currentUser: profileProvider.getUserName,
                            topic: value1.topicData.topic,
                            seq: value1.chatList.length > 0
                                ? value1.chatList.first.seq + 1
                                : 1,
                          )
                        : Container()
                  ],
                ),
              );
            }),
          );
        } else {
          return ColorLoader();
        }
      }),
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

        if (chlProvider.getchatList.length > 0) {
          if (msg.seq != chlProvider.getchatList.first.seq)
            chlProvider.addMsg(msg);
        } else {
          chlProvider.addMsg(msg);
        }

        break;
      case 'm':
        JRcvMeta meta = JRcvMeta.fromJson(data.msg);

        if (meta.hasSub()) {
          chlProvider.addSub(meta.sub);
          addMemberProvider.addMember(meta.sub);
          if (channelProvider.getCreated) {
            chlProvider.addTopicSub(channelProvider.getDataCreated);
            channelProvider.setCreated(false);
            chatListProvider.addSubListByTopic(channelProvider.dataCreated);
            channelProvider.clear();
          }
        }
        if (meta.hasDesc()) {
          chlProvider.addTopicDesc(meta.desc);
          if (channelProvider.getCreated) {
            channelProvider.addAcs(meta.desc.acs);
            channelProvider.addtimeTouch(DateTime.parse(meta.desc.updated));
            channelProvider.addTimeUpdate(DateTime.parse(meta.desc.updated));
          }
        }

        break;
      case 'c':
        JRcvCtrl ctrl = JRcvCtrl.fromJson(data.msg);
        if (ctrl.topic != '') {
          if (channelProvider.getCreated) {
            channelProvider.addtopic(ctrl.topic);
          }
          if (ctrl.hasParams()) {
            if (ctrl.params.user != null) {
              for (var item in addMemberProvider.dataAdded) {
                if (item.user == ctrl.params.user) {
                  item.acs = ctrl.params.acs;
                  chlProvider.addMemberSub(item);
                }
              }
            }
          }
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
          if (pres.GetPresDAcs().mode.isNull) {
            for (var item in chlProvider.dataSub) {
              if (item.topic == pres.src) {
                chlProvider.dataSub.remove(item);
              }
            }
          } else {
            GroupChannelSettings.addTopic(pres.src);
            chatListProvider.addedDataEn(true);
          }
        }

        if (pres.what == 'read') {
          chatListProvider.changReadMessage(pres.seq, pres.src);
        }
        break;
      default:
    }
  }
}
