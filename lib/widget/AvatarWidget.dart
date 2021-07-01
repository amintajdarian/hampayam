import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AvatarWidget extends StatelessWidget {
  String color1;
  String color2;
  Widget icon;
  String textAvatar;
  AvatarWidget({this.color1, this.color2, this.icon, this.textAvatar});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [HexColor("$color1"), HexColor("$color2")])),
            child: icon,
          ),
          radius: 23,
        ),
        SizedBox(
          height: 3,
        ),
        Text('$textAvatar'),
      ],
    );
  }
}
