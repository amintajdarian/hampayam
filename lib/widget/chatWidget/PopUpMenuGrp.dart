import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';

class PopUpMenuGrp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return PopupMenuButton(
      icon: Icon(
        Octicons.kebab_vertical,
        color: Colors.white,
        size: size / 35,
      ),
      tooltip: 'Info',
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
          child: Text(
            'Mute',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
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
