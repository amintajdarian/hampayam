import 'package:flutter/material.dart';

class CustomAppbar {
  static Widget customAppBar(double height, String barTitle, GlobalKey<ScaffoldState> key) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(height / 55)),
        child: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Color(0xFF33D6F2),
                  Color(0xFF4DAAED),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: height / 35, left: height / 40),
                child: Text(
                  barTitle,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35, shadows: [BoxShadow(offset: Offset(3, 3), color: Colors.purple, blurRadius: 3.0)]),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: height / 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                    onPressed: () {
                      key.currentState.openEndDrawer();
                      // this opens drawer
                    },
                    icon: Icon(
                      Icons.menu,
                      size: height / 35,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
