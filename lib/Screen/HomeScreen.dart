import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';

import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Messenging/Notification.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Pres.dart';
import 'package:hampayam_chat/Screen/navigationPages/PageChannel.dart';

import 'package:hampayam_chat/Screen/navigationPages/PageChatList.dart';
import 'package:hampayam_chat/Screen/navigationPages/PageWallet.dart';
import 'package:hampayam_chat/Screen/navigationPages/pageGroup.dart';
import 'package:hampayam_chat/Screen/navigationPages/pageUser.dart';
import 'package:hampayam_chat/StateManagement/ContactStateManagment/ContactProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/statusUserProvider.dart';

import 'package:hampayam_chat/StateManagement/HomeStateManagement/pageChangeProvider.dart';
import 'package:hampayam_chat/StateManagement/loginStateManagement/loginPageProvider.dart';

import 'package:hampayam_chat/widget/homeWidget/botomBar.dart';
import 'package:hampayam_chat/widget/homeWidget/customAppBar.dart';
import 'package:hampayam_chat/widget/homeWidget/endDrawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  StatusUserProvider onlieProvider;
  ChatListProvider chatListProvider;
  ProfileProvider profileProvider;
  ContactProvide contactProvide;
  LoginPageProvider loginPageProvider;
  String language = '';

  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  MessageNotifcation notifcation = MessageNotifcation();
  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
  @override
  void initState() {
    IORouter.activePage = 'home';

    IORouter.homeScreenChannel.stream.listen(onData);
    HampayamClient.getDataAutoLogin(context, language).then((value) {
      notifcation.initializing();
      getPermissions();
    });
    super.initState();
  }

  void getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      HampayamClient.getContatct();
    }
  }

  @override
  Widget build(BuildContext context) {
    language = context.locale.toLanguageTag();
    onlieProvider = Provider.of(context);
    chatListProvider = Provider.of(context);
    profileProvider = Provider.of(context);
    contactProvide = Provider.of(context);
    loginPageProvider = Provider.of(context);
    PageChangeProvider pageChangeProvider = Provider.of<PageChangeProvider>(context);
    var _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, _sizeH / 10),
        child: Visibility(visible: pageChangeProvider.enableAppbar, child: CustomAppbar.customAppBar(_sizeH, LocaleKeys.Messanger.tr(), _key)),
      ),
      endDrawer: MyDrawer(),
      body: Consumer3<PageChangeProvider, ChatListProvider, ProfileProvider>(builder: (context, value1, value2, vlaue3, child) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: (PageView(
            controller: _pageController,
            children: <Widget>[
              PageChatList(_sizeH),
              UserPage(_sizeH),
              PageWallet(MyDrawer()),
              GroupPage(_sizeH),
              ChannelPage(_sizeH),
            ],
            onPageChanged: (page) {
              _pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.ease);

              _pageController.jumpToPage(page);

              pageChangeProvider.changePageIndex(page);
              if (_pageController.page == 2)
                pageChangeProvider.changeEnableAppBAr(false);
              else
                pageChangeProvider.changeEnableAppBAr(true);
            },
          )),
        );
      }),
      bottomNavigationBar: BottomBar(_sizeH, this, _pageController),
    );
  }

  Future<void> onData(MsgType data) async {
    print(data.msg);
    if (data.type == 'p') {
      JRcvPres pres = JRcvPres.fromJson(data.msg);
      if (pres.what == 'off') {
        onlieProvider.deleteOnlineUser(pres.src);
      }
      if (pres.what == 'on') {
        onlieProvider.addOnlineUser(pres.src);
      }

      if (pres.what == 'msg') {
        chatListProvider.changUnreadMessage(pres.seq, pres.src);
        chatListProvider.changLastMessage(pres.extra.message, pres.extra.fn, pres.src);
        notifcation.showNotifications(pres.extra.fn, pres.extra.message);
      }

      if (pres.what == 'read') {
        chatListProvider.changreadMessage(pres.seq, pres.src);
      }
    }
  }
}
