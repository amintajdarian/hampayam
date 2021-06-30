import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'dart:ui' as ui;

import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:provider/provider.dart';

class SettigAppBar {
  static Widget customAppBar(double height, String barTitle,
      GlobalKey<ScaffoldState> key, BuildContext context,
      {String subtitle}) {
    TextEditingController nameController = TextEditingController();
    TextEditingController sNameController = TextEditingController();
    ProfileProvider profileProvider = Provider.of(context, listen: false);
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: AnimatedContainer(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '+');
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: height / 40,
                        )),
                    SizedBox(
                      width: height / 30,
                    ),
                    Text(
                      barTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: height / 37,
                          shadows: [
                            BoxShadow(
                                offset: Offset(3, 3),
                                color: Colors.purple,
                                blurRadius: 3.0)
                          ]),
                    ),
                    SizedBox(
                      width: height / 3,
                    ),
                    IconButton(
                        onPressed: () {
                          AwesomeDialog(
                              btnOkOnPress: () {
                                if (sNameController.text.length > 0 &&
                                    nameController.text.length > 0) {
                                  HampayamClient.changeProfileName(
                                      nameController.text,
                                      surname: sNameController.text);
                                  profileProvider.fname(
                                    nameController.text,
                                  );
                                  profileProvider.sname(sNameController.text);
                                  sNameController.clear();
                                  nameController.clear();
                                } else if (nameController.text.length > 0) {
                                  HampayamClient.changeProfileName(
                                    nameController.text,
                                  );
                                  profileProvider.fname(
                                    nameController.text,
                                  );
                                  nameController.clear();
                                }
                              },
                              btnOkColor: Colors.blue,
                              title: 'Change Name',
                              context: context,
                              animType: AnimType.TOPSLIDE,
                              dialogType: DialogType.INFO_REVERSED,
                              body: Column(
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    decoration: new InputDecoration(
                                      labelText: "Enter your new Name",
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(35.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      //fillColor: Colors.green
                                    ),
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 45,
                                  ),
                                  TextFormField(
                                    controller: sNameController,
                                    decoration: new InputDecoration(
                                      labelText:
                                          "Enter your new surName (Optional)",
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(35.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      //fillColor: Colors.green
                                    ),
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 45,
                                  ),
                                  SizedBox(
                                    height: height / 45,
                                  ),
                                ],
                              )).show();
                        },
                        icon: Icon(
                          Octicons.kebab_vertical,
                          color: Colors.white,
                          size: height / 40,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
