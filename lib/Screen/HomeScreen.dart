import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Screen/navigationPages/PageChannel.dart';

import 'package:hampayam_chat/Screen/navigationPages/PageChatList.dart';
import 'package:hampayam_chat/Screen/navigationPages/PageWallet.dart';
import 'package:hampayam_chat/Screen/navigationPages/pageGroup.dart';
import 'package:hampayam_chat/Screen/navigationPages/pageUser.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/pageChangeProvider.dart';
import 'package:hampayam_chat/widget/homeWidget/botomBar.dart';
import 'package:hampayam_chat/widget/homeWidget/customAppBar.dart';
import 'package:hampayam_chat/widget/homeWidget/endDrawer.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int currentTab = 0;

  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this

  @override
  Widget build(BuildContext context) {
    PageChangeProvider pageChangeProvider = Provider.of<PageChangeProvider>(context);
    var _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, _sizeH / 12),
        child: Visibility(visible: pageChangeProvider.enableAppbar, child: CustomAppbar.customAppBar(_sizeH, LocaleKeys.Messanger.tr(), _key)),
      ),
      endDrawer: MyDrawer(),
      body: Consumer<PageChangeProvider>(builder: (context, value, child) {
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
              currentTab = page;
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
}
