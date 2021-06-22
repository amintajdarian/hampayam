import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/chatButtonProvide.dart';

class BottomBarWidget extends StatelessWidget {
  Animation animation;
  FocusNode focusNode;
  AnimationController controller;
  TextEditingController textController;
  double size;
  ChatButtonProvider buttonProvider;
  String topic;
  String currentUser;
  BottomBarWidget({this.size, this.animation, this.focusNode, this.textController, this.controller, this.buttonProvider, this.topic, this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size / 60, left: size / 70, right: size / 70, top: size / 65),
      height: size / 18,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size / 25),
                boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)],
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.face), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      focusNode: focusNode,
                      decoration: InputDecoration(hintText: "Type Something...", border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size / 85),
          buttonProvider.getButtonEn
              ? Container(
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
                      Icons.send,
                      color: Colors.white,
                    ),
                    onTap: () {
                      ChatContent.sendTextMessage(topic, textController.text, currentUser, context);
                      textController.clear();
                    },
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
