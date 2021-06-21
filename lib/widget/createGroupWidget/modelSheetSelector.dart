import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hexcolor/hexcolor.dart';

class ModalFit extends StatelessWidget {
  double size;
  ModalFit(this.size);

  Widget avatar(String txt, Icon icon, String hex1, String hex2) {
    return Column(
      children: [
        CircleAvatar(
          child: Container(
            height: size / 10,
            width: size / 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  HexColor("$hex1"),
                  HexColor("$hex2"),
                ])),
            child: icon,
          ),
          radius: size / 20,
        ),
        Text('$txt'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size / 20,
            height: size / 6,
          ),
          InkWell(
            onTap: () {
              HampayamClient.getImagefromcamera(context);
            },
            child: avatar("Camera", Icon(FontAwesome5.camera_retro), "#7B1FA2", "#7C4DFF"),
          ),
          SizedBox(
            width: size / 20,
          ),
          InkWell(
              onTap: () {
                HampayamClient.getImagefromGallery(context);
              },
              child: avatar("Gallery", Icon(FontAwesome.picture), "#FFA000", "#D500F9")),
        ],
      ),
    ));
  }
}
