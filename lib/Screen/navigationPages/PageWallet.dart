import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/colors/colors.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:hampayam_chat/widget/homeWidget/endDrawer.dart';
import 'package:hampayam_chat/widget/homeWidget/walletWidget.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../notifictionScreen.dart';

class PageWallet extends StatelessWidget {
  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this

  final MyDrawer drawer;
  PageWallet(this.drawer);
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    var _sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      endDrawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_sizeH * .45),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
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
            child: Column(
              children: [
                /* Header */
                Container(
                  padding: EdgeInsets.only(top: _sizeH / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Avatar */
                      Container(
                        width: _sizeH / 12,
                        height: _sizeH / 12,
                        margin: EdgeInsets.symmetric(horizontal: _sizeH / 50),
                        child: HampayamClient.showImage(
                          profileProvider.getPhoto,
                          profileProvider.getToken,
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          _sizeH,
                        ),
                      ),
                      /* Greeting & Username */
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.Hello.tr(),
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: _sizeH / 50),
                            ),
                            SizedBox(
                              height: _sizeH / 70,
                            ),
                            Text(
                              profileProvider.fn,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: _sizeH / 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* Notification Button */
                      IconButton(
                        icon: new Stack(children: <Widget>[
                          new Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: _sizeH / 40,
                          ),
                          new Positioned(
                            // draw a red marble
                            top: 0.0,
                            right: 0.0,
                            child: new Icon(Icons.brightness_1, size: 8.0, color: Colors.redAccent),
                          )
                        ]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotificationScreen()),
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            _key.currentState.openEndDrawer();
                            // this opens drawer
                          },
                          icon: Icon(
                            Icons.menu,
                            size: _sizeH / 40,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                /* Balance */
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.credit.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _sizeH / 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          LocaleKeys.Toman.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /* Access */
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // width: MediaQuery.of(context).size.width - 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: _sizeH / 30,
                              ),
                              Text(
                                LocaleKeys.Up.tr(),
                                style: TextStyle(fontSize: _sizeH / 60, color: Colors.white),
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(
                                Icons.payment,
                                color: Colors.white,
                                size: _sizeH / 30,
                              ),
                              Text(
                                LocaleKeys.Up.tr(),
                                style: TextStyle(fontSize: _sizeH / 60, color: Colors.white),
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(
                                FontAwesome5.qrcode,
                                color: Colors.white,
                                size: _sizeH / 30,
                              ),
                              Text(
                                LocaleKeys.Qr.tr(),
                                style: TextStyle(fontSize: _sizeH / 60, color: Colors.white),
                              )
                            ],
                          )),
                      // AccessIconWidget(icon: Icons.payment, text: LocaleKeys.Pay.tr()),
                      //AccessIconWidget(icon: FontAwesome5.qrcode, text: LocaleKeys.Qr.tr()),
                    ],
                  ),
                ),

                /* Last Transaction */
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Last Transaction",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorCustoms.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext ctx) {
                          return DetailTransactionModal();
                        });
                  },
                  child: Text(
                    'See all',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF68BBF0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TransactionItemWidget(
                      title: "Tokopedia",
                      colorImage: Color(0xFF47AD14),
                    ),
                    TransactionItemWidget(
                      title: "Bukalapak",
                      colorImage: Color(0xFFE44252),
                      image: 'https://s2.bukalapak.com/marketplace/favicon-new.ico',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
