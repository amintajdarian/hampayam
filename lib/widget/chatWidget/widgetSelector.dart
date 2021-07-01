import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/PubContent.dart';

class WidgetSelector extends StatelessWidget {
  String token;
  JRcvMsg msg;
  double size;

  WidgetSelector(this.size, this.msg, this.token);
  @override
  Widget build(BuildContext context) {
    if (msg.hasHead()) {
      JPubContent pubContent = JPubContent.fromJson(msg.content);
      if (pubContent.ent[0].data.mime.startsWith('image')) {
        return CachedNetworkImage(
          imageUrl: HttpConnection.fileUrl(
              IORouter.ipAddress, pubContent.ent[0].data.val),
          httpHeaders: HttpConnection.setHeader(IORouter.apiKey, token),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          imageBuilder: (context, imageProvider) => Container(
            width: size / 3,
            height: size / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
        );
      } else {
        Expanded(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.file_present),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      child: Icon(Icons.download),
                    )
                  ],
                ),
                Text(
                  pubContent.ent[0].data.name,
                )
              ],
            ),
          ),
        );
      }
    } else {
      return Container(
        width: size / 3,
        child: Text(msg.content,
            maxLines: 15,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1.apply(
                  color: Colors.black87,
                )),
      );
    }
  }
}
