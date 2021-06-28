import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/AddMemberProvider.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ItemAddMemberContact {
  static List<Widget> listOfContact(
      List<JSubscriptionData> subList,
      List<JSubscriptionData> member,
      double size,
      BuildContext context,
      String token) {
    AddMemberProvider addMemberProvider = Provider.of(context, listen: false);

    List<Widget> listItem = [];
    if (subList != null) {
      for (var item in subList) {
        String subName = item.public.fn.substring(0, 2);
        listItem.add(Card(
            child: Padding(
          padding: EdgeInsets.all(size / 200),
          child: ListTile(
            trailing: isMember(member, item, subList, addMemberProvider, size),
            title: Text(item.public.fn),
            subtitle: Text(item.private[0]),
            leading: item.public.photo != null
                ? CachedNetworkImage(
                    imageUrl: HttpConnection.fileUrl(
                        IORouter.ipAddress, item.public.photo.data),
                    httpHeaders:
                        HttpConnection.setHeader(IORouter.apiKey, token),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    imageBuilder: (context, imageProvider) => Container(
                      width: size / 15,
                      height: size / 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: size / 30,
                    child: Text(
                      subName,
                    ),
                  ),
          ),
        )));
      }
    }
    if (listItem.length < 0) {
      listItem.add(Text('No Contact Exist'));
    }
    return listItem;
  }

  static Widget isMember(
      List<JSubscriptionData> member,
      JSubscriptionData itemContact,
      List<JSubscriptionData> subList,
      AddMemberProvider addMemberProvider,
      double size) {
    int counter = 0;
    for (var item in member) {
      if (itemContact.user == item.user) {
        counter++;
      }
    }
    if (counter == 0) {
      return RoundCheckBox(
        isChecked: addMemberProvider.getValue[subList.indexOf(itemContact)],
        size: size / 25,
        onTap: (selected) {
          addMemberProvider.changeValue(selected, subList.indexOf(itemContact));
          addMemberProvider.setDataAdded(subList);
          addMemberProvider.floatingBtnEnable();
        },
      );
    } else
      return Text('Added Member');
  }
}
