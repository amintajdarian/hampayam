import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

import 'package:hexcolor/hexcolor.dart';

class InfoGrp extends StatelessWidget {
  bool exit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Padding(
                padding: const EdgeInsets.only(top: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('amin'),
                    Text(
                      "Last Seen recently",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 150,
                    ),
                    onPressed: () {})
              ],
              backgroundColor: Colors.tealAccent,
              expandedHeight: MediaQuery.of(context).size.height * .45,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(),
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
                          Row(
                            children: [
                              Icon(Linecons.comment),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bio",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ' fffffffff',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                value: true,
                                onChanged: (value) {},
                                activeTrackColor: Colors.deepPurple[200],
                                activeColor: HexColor("#694AE3"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {},
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
                                    style: TextStyle(color: Colors.blue, fontSize: 24),
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
                                    style: TextStyle(color: Colors.red, fontSize: 24),
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
                                      style: TextStyle(color: Colors.red, fontSize: 24),
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
      ),
    );
  }
}
