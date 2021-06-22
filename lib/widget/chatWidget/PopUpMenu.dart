import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.account_box),
      tooltip: 'Account',
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
            'FAQ',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
          child: Text(
            'Website',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        PopupMenuItem(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
