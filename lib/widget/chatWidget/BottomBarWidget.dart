import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/ChlProvder.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/GrpProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/chatButtonProvide.dart';
import 'package:provider/provider.dart';

class BottomBarWidget extends StatelessWidget {
  Animation animation;
  FocusNode focusNode;
  AnimationController controller;
  TextEditingController textController;
  double size;
  ChatButtonProvider buttonProvider;
  String topic;
  int seq;
  String currentUser;
  P2pProvider p2pProvider;
  GrpProvider grpProvider;
  ChlProvider chlProvider;
  BottomBarWidget({
    this.size,
    this.animation,
    this.focusNode,
    this.textController,
    this.controller,
    this.buttonProvider,
    this.topic,
    this.currentUser,
    this.seq,
  });

  @override
  build(BuildContext context) {
    p2pProvider = Provider.of(context);
    grpProvider = Provider.of(context);
    chlProvider = Provider.of(context);
    return Container(
      margin: EdgeInsets.only(
          bottom: size / 60, left: size / 70, right: size / 70, top: size / 65),
      height: size / 18,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size / 25),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.face), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          hintText: "Type Something...",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size / 85),
          buttonProvider.getButtonEn
              ? InkWell(
                  onTap: () {
                    ChatContent.sendTextMessage(
                        topic, textController.text, currentUser, context);
                    JRcvMsg msg = JRcvMsg(
                        topic: topic,
                        from: currentUser,
                        ts: DateTime.now().toUtc().toString(),
                        seq: seq,
                        content: textController.text);
                    if (topic.startsWith('usr')) {
                      p2pProvider.inserMsg(msg);
                    }
                    if (topic.startsWith('grp')) {
                      grpProvider.inserstMsg(msg);
                    } else if (topic.startsWith('chl')) {
                      chlProvider.inserstMsg(msg);
                    }

                    textController.clear();
                  },
                  child: Container(
                    padding: EdgeInsets.all(size / 65),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: new LinearGradient(colors: [
                        Color(0xFF33D6F2),
                        Color(0xFF4DAAED),
                      ]),
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(size / 65),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: new LinearGradient(colors: [
                      Color(0xFF33D6F2),
                      Color(0xFF4DAAED),
                    ]),
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onTap: () {
                      //  _showBottom = true;
                    },
                  ),
                )
        ],
      ),
    );
  }
}
