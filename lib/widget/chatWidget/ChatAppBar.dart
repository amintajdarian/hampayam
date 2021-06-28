import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Messenging/ChatContent.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:hampayam_chat/widget/chatWidget/PopUpMenuGrp.dart';
import 'package:provider/provider.dart';

class ChatAppBar extends StatelessWidget {
  double height;
  JSubscriptionData data;
  String token;
  ChatAppBar({this.data, this.height, this.token});
  Widget selectPopUp() {
    if (data.topic.startsWith('grp')) {
      return PopUpMenuGrp();
    }
  }

  @override
  Widget build(BuildContext context) {
    P2pProvider p2pProvider = Provider.of(context);
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: height / 100,
                  ),
                  IconButton(
                      onPressed: () {
                        IORouter.activePage = 'home';
                        ChatContent.leaveChat(data.topic);
                        p2pProvider.leaveSub();
                        Navigator.of(context).popAndPushNamed('+');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: height / 30,
                      )),
                  SizedBox(
                    width: height / 80,
                  ),
                  data.public.photo != null
                      ? CachedNetworkImage(
                          imageUrl: HttpConnection.fileUrl(
                              IORouter.ipAddress, data.public.photo.data),
                          httpHeaders:
                              HttpConnection.setHeader(IORouter.apiKey, token),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          imageBuilder: (context, imageProvider) => Container(
                            width: height / 15,
                            height: height / 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: height / 30,
                          child: Text(
                            data.public.fn.substring(0, 2),
                          ),
                        ),
                  SizedBox(
                    width: height / 85,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.public.fn,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.touched.toLocal().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 55,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: height / 40, right: height / 40),
                  child: selectPopUp()),
            ],
          ),
        ),
      ),
    );
  }
}
