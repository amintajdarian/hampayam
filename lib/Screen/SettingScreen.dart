import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:hampayam_chat/widget/SettingAppbar.dart';
import 'package:hampayam_chat/widget/modelSheetSelectorSetting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 12),
        child: SettigAppBar.customAppBar(
            height, LocaleKeys.Setting.tr(), key, context),
      ),
      body: Consumer<ProfileProvider>(builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: ModalFitSetting(height / 1.5),
                      ),
                    );
                  },
                  child: Container(
                    child: value.getPhoto != ''
                        ? CachedNetworkImage(
                            imageUrl: HttpConnection.fileUrl(
                                IORouter.ipAddress, value.getPhoto),
                            httpHeaders: HttpConnection.setHeader(
                                IORouter.apiKey, value.getToken),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            imageBuilder: (context, imageProvider) => Container(
                              width: height / 5,
                              height: height / 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          )
                        : CircleAvatar(radius: 35, child: Icon(Icons.person)),
                    height: height / 7,
                    width: height / 7,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "your name",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Align(alignment: Alignment.center, child: Text(value.getFname)),
              Divider(
                thickness: 2,
                height: 15,
                endIndent: 55,
                indent: 55,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      Typicons.key,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Change number & Security",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Message,Group & Call tones",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      FontAwesome.chat_empty,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Chat Setting",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Theme,Walpaper,Chat History",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      Entypo.arrows_ccw,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Storage and data",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Network usage, auto-download",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      FontAwesome.question_circle_o,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "FAQ, contact us",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: ListTile(
                  onTap: () {},
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      FontAwesome.language,
                      size: 30,
                      color: HexColor("#694AE3"),
                    ),
                  ),
                  title: Text(
                    "Language",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Text(
                      'English',
                      style:
                          TextStyle(color: HexColor("#694AE3"), fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
