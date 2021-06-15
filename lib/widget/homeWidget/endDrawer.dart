import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: EasyLocalization.of(context).currentLocale.toString() == 'fa'
            ? BorderRadius.only(
                bottomRight: Radius.circular(150),
              )
            : BorderRadius.only(
                bottomLeft: Radius.circular(200),
              ),
        child: SizedBox(
          child: Drawer(
            child: Container(
              width: _size * .1,
              height: MediaQuery.of(context).size.height,
              color: HexColor('#00E5FF'),
              child: Scrollbar(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: _size / 10),
                    Container(
                      margin: EdgeInsets.only(
                        left: _size / 20,
                        //   //bottom: 10,
                      ),
                    ),
                    SizedBox(height: _size / 30),
                    Container(
                      margin: EdgeInsets.only(left: _size / 20),
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: _size / 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 45),
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: _size / 40),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: _size / 20),
                      child: Text(
                        " ",
                        style: TextStyle(color: Colors.white, fontSize: _size / 40),
                      ),
                    ),
                    SizedBox(height: _size / 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: _size / 10),
                        child: Row(
                          children: [
                            Icon(
                              Typicons.users_outline,
                              color: Colors.white,
                            ),
                            SizedBox(width: _size / 30),
                            Text(
                              LocaleKeys.DrawerCreatGrp.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size / 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: _size / 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Container(
                        alignment: Alignment.center,
                        height: _size / 500,
                        width: _size * .8,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: _size / 30),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: _size / 10),
                        child: Row(
                          children: [
                            Icon(
                              Typicons.chat_alt,
                              color: Colors.white,
                            ),
                            SizedBox(width: _size / 30),
                            Text(
                              LocaleKeys.DrawerCreatChl.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size / 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: _size / 30),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: _size / 10),
                        child: Row(
                          children: [
                            Icon(
                              Typicons.chat_alt,
                              color: Colors.white,
                            ),
                            SizedBox(width: _size / 30),
                            Text(
                              LocaleKeys.DrawerCreatChl.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size / 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: _size / 30),

                    Container(
                      margin: EdgeInsets.only(left: _size * .12),
                      height: _size / 500,
                      width: _size * .8,
                      color: Colors.white,
                    ),
                    // Divider(
                    //   color: Colors.white,
                    //   indent: 85.0,
                    // ),
                    SizedBox(height: _size / 30),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        margin: EdgeInsets.only(left: _size / 10),
                        child: Row(
                          children: [
                            Icon(
                              Typicons.user_add_outline,
                              color: Colors.white,
                            ),
                            SizedBox(width: _size / 30),
                            Text(
                              LocaleKeys.DrawerContacts.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size / 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: _size / 30),
                    Container(
                      margin: EdgeInsets.only(left: _size * .12),
                      height: _size / 500,
                      width: _size * .8,
                      color: Colors.white,
                    ),
                    // Divider(
                    //   color: Colors.white,
                    //   indent: 85.0,
                    // ),
                    SizedBox(height: _size / 30),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: _size / 10),
                        child: Row(
                          children: [
                            Icon(
                              Typicons.facebook_circled,
                              color: Colors.white,
                            ),
                            SizedBox(width: _size / 30),
                            Text(
                              LocaleKeys.DrawerSocialPnel.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _size / 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: _size / 8),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              WebSymbols.logout,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            LocaleKeys.Logout.tr(),
                            style: TextStyle(color: Colors.white, fontSize: _size / 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _size / 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
