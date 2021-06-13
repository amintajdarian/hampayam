import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomIcon extends StatelessWidget {
  final IconData iconData;
  ButtomIcon({this.iconData});
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: _size / 25, right: _size / 35),
      child: Container(
        padding: EdgeInsets.all(_size / 40),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: new Icon(
          iconData,
          color: Color(0xFF0084ff),
        ),
      ),
    );
  }
}
