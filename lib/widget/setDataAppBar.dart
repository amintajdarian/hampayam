import 'package:flutter/material.dart';
import 'package:hampayam_chat/StateManagement/CreateChannelProvider/CreateChannelProvider.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:provider/provider.dart';

class SetDataAppBar {
  static Widget customAppBar(double height, String barTitle,
      GlobalKey<ScaffoldState> key, BuildContext context,
      {String subtitle}) {
    CreateChannelProvider channelProvider = Provider.of(context);
    CreateGrpProvider grpProvider = Provider.of(context);

    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(height / 55)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: height / 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        barTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 35,
                            shadows: [
                              BoxShadow(
                                  offset: Offset(3, 3),
                                  color: Colors.purple,
                                  blurRadius: 3.0)
                            ]),
                      ),
                      subtitle != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height / 50,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: height / 40, right: height / 40),
                child: IconButton(
                    onPressed: () {
                      if (channelProvider.getImage != null ||
                          channelProvider.getNameChannel != null) {
                        channelProvider.clear();
                      }
                      if (grpProvider.getImage != null ||
                          grpProvider.getNameGrp != null) {
                        grpProvider.clearData();
                      }
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: height / 30,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
