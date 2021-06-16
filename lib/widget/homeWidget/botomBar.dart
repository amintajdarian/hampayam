import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/pageChangeProvider.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomBar extends StatelessWidget {
  final double size;
  final PageController pageController;
  final TickerProvider vsync;
  BottomBar(this.size, this.vsync, this.pageController);

  @override
  Widget build(BuildContext context) {
    PageChangeProvider pageChangeProvider = Provider.of<PageChangeProvider>(context);

    return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        gradient: new LinearGradient(
            colors: [
              Color(0xFF33D6F2),
              Color(0xFF4DAAED),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        controller: TabController(length: 5, initialIndex: pageChangeProvider.getPageIndex, vsync: vsync),
        height: size / 15,
        top: -1 * size / 50,
        curveSize: size / 12,
        cornerRadius: size / 30,
        activeColor: Colors.yellow,
        elevation: 10.0,
        style: TabStyle.fixed,
        items: [
          TabItem(title: LocaleKeys.NavMessage.tr(), icon: Icons.message),
          TabItem(title: LocaleKeys.NavP2PChat.tr(), icon: Icons.person),
          TabItem(title: LocaleKeys.Wallet.tr(), icon: Linecons.wallet),
          TabItem(title: LocaleKeys.NavGroups.tr(), icon: Icons.group),
          TabItem(title: LocaleKeys.NavChannels.tr(), icon: Linecons.sound),
        ],
        initialActiveIndex: pageChangeProvider.getPageIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          pageChangeProvider.changePageIndex(index);
        },
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 20;

  @override
  double get iconSize => 30;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 25, color: color);
  }
}
