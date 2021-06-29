import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/GrpProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class InfoP2p extends StatelessWidget {
  bool exit = false;

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of(context);
    var size = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<P2pProvider>(builder: (context, value, child) {
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
                        value.dataSub.public.fn,
                        style: TextStyle(fontSize: size / 35),
                      )),
                    ],
                  ),
                ),
                backgroundColor: Colors.tealAccent,
                expandedHeight: MediaQuery.of(context).size.height * .45,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: value.dataSub.public.photo != null
                        ? Container(
                            child: Image(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                  HttpConnection.fileUrl(IORouter.ipAddress,
                                      value.dataSub.public.photo.data),
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
                                  value: value.dataAcs.mode.isGetNotified,
                                  onChanged: (value) {},
                                  activeTrackColor: Colors.deepPurple[200],
                                  activeColor: HexColor("#694AE3"),
                                ),
                              ],
                            ),
                            ListTile(
                              title: Text(
                                'User Id :',
                                style: TextStyle(fontSize: size / 55),
                              ),
                              trailing: Text(
                                value.dataSub.topic,
                                style: TextStyle(fontSize: size / 55),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Your permissions:',
                                style: TextStyle(fontSize: size / 55),
                              ),
                              trailing: Text(
                                value.dataSub.acs.mode.permisson,
                                style: TextStyle(fontSize: size / 55),
                              ),
                            ),
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
