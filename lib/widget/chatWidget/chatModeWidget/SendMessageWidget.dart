import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hampayam_chat/Model/DeSeserilizedJson/MsgData.dart';

import '../widgetSelector.dart';

class SendMsg {
  static Widget sendMsgMode(double size, JRcvMsg msg, String name,
      BuildContext context, String token) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(size / 70),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.caption,
                ),
                Container(
                    padding: EdgeInsets.all(size / 70),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: WidgetSelector(size, msg, token)),
              ],
            ),
            SizedBox(width: 15),
            Text(
              DateTime.parse(msg.ts).toLocal().hour.toString() +
                  ':' +
                  DateTime.parse(msg.ts).toLocal().minute.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .apply(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
