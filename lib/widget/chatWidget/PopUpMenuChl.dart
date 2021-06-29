import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:hampayam_chat/Screen/chatScreen/ChlChat/ChlInfoScreen.dart';

class PopUpMenuChl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => InfoChl()));
        }
      },
      icon: Icon(
        Octicons.kebab_vertical,
        color: Colors.white,
        size: size / 35,
      ),
      tooltip: 'Info',
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            'info',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Mute',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            'Leave',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
