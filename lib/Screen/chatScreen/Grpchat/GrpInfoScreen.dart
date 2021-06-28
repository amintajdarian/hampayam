import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Messenging/GroupSettings.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Screen/chatScreen/AddMember/AddMemberScreen.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/AddMemberProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/GrpProvider.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../HomeScreen.dart';

class InfoGrp extends StatelessWidget {
  bool exit = false;

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of(context);
    var size = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<GrpProvider>(builder: (context, value, child) {
        return Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                toolbarHeight: size / 10,
                snap: true,
                floating: true,
                pinned: true,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                leading: Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: size / 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        value.topicData.public.fn,
                        style: TextStyle(fontSize: size / 35),
                      )),
                    ],
                  ),
                ),
                backgroundColor: Colors.tealAccent,
                expandedHeight: MediaQuery.of(context).size.height * .45,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: value.getTopicData.public.photo != null
                        ? Container(
                            child: Image(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                  HttpConnection.fileUrl(IORouter.ipAddress,
                                      value.topicData.public.photo.data),
                                  headers: HttpConnection.setHeader(
                                      IORouter.apiKey,
                                      profileProvider.getToken),
                                )))
                        : Icon(Icons.group)),
              ),
              SliverList(
                delegate: new SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 18,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Notifications",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 90),
                                        child: Text(
                                          "On",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: value.getDataDesc.defacs.auth.isJoin,
                                  onChanged: (value) {},
                                  activeTrackColor: Colors.deepPurple[200],
                                  activeColor: HexColor("#694AE3"),
                                ),
                              ],
                            ),
                            ListTile(
                              title: Text(
                                'Group Id :',
                                style: TextStyle(fontSize: size / 55),
                              ),
                              trailing: Text(
                                value.topicData.topic,
                                style: TextStyle(fontSize: size / 55),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Your permissions:',
                                style: TextStyle(fontSize: size / 55),
                              ),
                              trailing: Text(
                                value.topicData.acs.mode.permisson,
                                style: TextStyle(fontSize: size / 55),
                              ),
                            ),
                            ListTile(
                                title: Text(
                                  'Default access mode:',
                                  style: TextStyle(fontSize: size / 55),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Auth:',
                                          style: TextStyle(fontSize: size / 55),
                                        ),
                                        SizedBox(
                                          width: size / 25,
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              alignment: Alignment.center,
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(25)),
                                                      side: BorderSide(
                                                          color: Colors.blue))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue
                                                          .withOpacity(0.3))),
                                          onPressed: () {
                                            AwesomeDialog(
                                              context: context,
                                              animType: AnimType.SCALE,
                                              dialogType: DialogType.INFO,
                                              body: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      'Join',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.auth.isJoin,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Read ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.auth.isRead,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Write ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.auth.isWrite,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Get notified',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .auth
                                                          .isGetNotified,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Approve ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .auth
                                                          .isApprove,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Share ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.auth.isShare,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Delete ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .auth
                                                          .isApprove,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Share ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.auth.isShare,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              title: 'This is Ignored',
                                              desc: 'This is also Ignored',
                                            )..show();
                                          },
                                          child: Text(
                                              value.dataDesc.defacs.auth
                                                  .permisson,
                                              style: TextStyle(
                                                  fontSize: size / 55)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Anon:',
                                          style: TextStyle(fontSize: size / 55),
                                        ),
                                        SizedBox(
                                          width: size / 25,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            AwesomeDialog(
                                              context: context,
                                              animType: AnimType.SCALE,
                                              dialogType: DialogType.INFO,
                                              body: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      'Join',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.anon.isJoin,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Read ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.anon.isRead,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Write ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.anon.isWrite,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Get notified',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .anon
                                                          .isGetNotified,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Approve ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .anon
                                                          .isApprove,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Share ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.anon.isShare,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Delete ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value
                                                          .getDataDesc
                                                          .defacs
                                                          .anon
                                                          .isApprove,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      'Share ',
                                                      style: TextStyle(
                                                          fontSize: size / 50),
                                                    ),
                                                    trailing: Switch(
                                                      onChanged: (select) {
                                                        print(select);
                                                      },
                                                      value: value.getDataDesc
                                                          .defacs.anon.isShare,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              title: 'This is Ignored',
                                              desc: 'This is also Ignored',
                                            )..show();
                                          },
                                          style: ButtonStyle(
                                              alignment: Alignment.center,
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(25)),
                                                      side: BorderSide(
                                                          color: Colors.blue))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue
                                                          .withOpacity(0.3))),
                                          child: Text(
                                              value.dataDesc.defacs.anon
                                                  .permisson,
                                              style: TextStyle(
                                                  fontSize: size / 55)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              AddMemberScreen(
                                            topic: value.getTopicData.topic,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Typicons.user_add),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Add Member",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 90),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...value.getDataSub.map(
                              (dataSub) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Visibility(
                                  visible: value.topicData.acs.mode.isShare,
                                  child: ListTile(
                                    title: Text(
                                      dataSub.public.fn,
                                      style: TextStyle(
                                          fontSize: size / 55,
                                          color: Colors.black),
                                    ),
                                    leading: dataSub.public.photo != null
                                        ? CachedNetworkImage(
                                            imageUrl: HttpConnection.fileUrl(
                                                IORouter.ipAddress,
                                                dataSub.public.photo.data),
                                            httpHeaders:
                                                HttpConnection.setHeader(
                                                    IORouter.apiKey,
                                                    profileProvider.token),
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: size / 15,
                                              height: size / 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue),
                                            width: size / 15,
                                            height: size / 15,
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                          ),
                                    trailing: TextButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.INFO,
                                          body: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  'Join',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                    onChanged: (select) {
                                                      print(select);
                                                    },
                                                    value: dataSub
                                                        .acs.mode.isJoin),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Read ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value:
                                                      dataSub.acs.mode.isRead,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Write ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value:
                                                      dataSub.acs.mode.isWrite,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Get notified',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value: dataSub
                                                      .acs.mode.isGetNotified,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Approve ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value: dataSub
                                                      .acs.mode.isApprove,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Share ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value:
                                                      dataSub.acs.mode.isShare,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Delete ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value: dataSub
                                                      .acs.mode.isApprove,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Share ',
                                                  style: TextStyle(
                                                      fontSize: size / 50),
                                                ),
                                                trailing: Switch(
                                                  onChanged: (select) {
                                                    print(select);
                                                  },
                                                  value:
                                                      dataSub.acs.mode.isShare,
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: 'This is Ignored',
                                          desc: 'This is also Ignored',
                                        )..show();
                                      },
                                      style: ButtonStyle(
                                          alignment: Alignment.center,
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25)),
                                                  side: BorderSide(
                                                      color: Colors.blue))),
                                          backgroundColor:
                                              MaterialStateProperty.all(Colors
                                                  .blue
                                                  .withOpacity(0.3))),
                                      child: Text(
                                        dataSub.acs.mode.permisson,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        endIndent: 20,
                        indent: 30,
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Entypo.trash,
                                    size: 29,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      'Clear messages',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.report,
                                    size: 29,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      'Report conversation',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  exit = true;
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      MfgLabs.logout,
                                      size: 29,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        'Leave conversation',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 24),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        );
      }),
    );
  }
}
