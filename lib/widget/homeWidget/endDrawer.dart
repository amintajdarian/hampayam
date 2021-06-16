import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  Widget divider(double size) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: Container(
        alignment: Alignment.center,
        height: size / 500,
        width: size * .8,
        color: Colors.white,
      ),
    );
  }

  Widget sizeBox(double size) {
    return SizedBox(height: size / 30);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: _size / 10),
      child: ClipRRect(
        borderRadius: EasyLocalization.of(context).currentLocale.toString() == 'fa'
            ? BorderRadius.only(
                bottomRight: Radius.circular(150),
              )
            : BorderRadius.only(
                bottomLeft: Radius.circular(150),
              ),
        child: SizedBox(
          child: Drawer(
            child: Container(
              color: HexColor('#00E5FF'),
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: profileProvider.getPhoto != null
                            ? CachedNetworkImage(
                                imageUrl: HttpConnection.fileUrl(IORouter.ipAddress, profileProvider.photoFile),
                                httpHeaders: HttpConnection.setHeader(IORouter.apiKey, profileProvider.getToken),
                                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                imageBuilder: (context, imageProvider) => Container(
                                  width: _size / 5,
                                  height: _size / 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                  ),
                                ),
                              )
                            : CircleAvatar(radius: 35, child: Icon(Icons.person)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45),
                        child: Text(
                          profileProvider.getFname,
                          style: TextStyle(color: Colors.white, fontSize: _size / 40),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: _size / 20),
                        child: Text(
                          profileProvider.getPhone,
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
                      sizeBox(_size),
                      divider(_size),
                      sizeBox(_size),
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
                      sizeBox(_size),
                      divider(_size),
                      sizeBox(_size),
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
                      sizeBox(_size),
                      divider(_size),
                      sizeBox(_size),
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
                                LocaleKeys.Setting.tr(),
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
                      sizeBox(_size),
                      divider(_size),
                      sizeBox(_size),
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
      ),
    );
  }
}