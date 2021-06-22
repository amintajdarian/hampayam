import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ReceivesMsg {
  double size;
  JRcvMsg msg;
  JSubscriptionData sub;

  static Widget rcvMsgMode(double size, JRcvMsg msg, String name, BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.all(size / 80),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
                    padding: EdgeInsets.all(size / 70),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF33D6F2),
                        Color(0xFF4DAAED),
                      ]),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      msg.content,
                      style: Theme.of(context).textTheme.bodyText1.apply(
                            color: Colors.black87,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Text(
              msg.ts,
              style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
