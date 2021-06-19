import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/translations/locale_keys.g.dart';
import 'TabIndication.dart';

class MenuBar extends StatelessWidget {
  final Function tapRight;
  final Function tapLeft;
  final PageController pageController;
  MenuBar({this.tapLeft, this.tapRight, this.pageController});

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;

    return Container(
      width: _size * .6,
      height: _size * .1,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Center(
        child: CustomPaint(
          painter: TabIndicationPainter(size: _size * .5, dxEntry: _size / 21, dy: _size / 21, dxTarget: _size * .26, radius: _size / 30, pageController: pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: tapLeft,
                  child: Text(
                    LocaleKeys.Accounts.tr(),
                    style: TextStyle(color: Colors.black, fontSize: _size / 29, fontFamily: "WorkSansSemiBold"),
                  ),
                ),
              ),
              //Container(height: 33.0, width: 1.0, color: Colors.white),
              Expanded(
                child: TextButton(
                  onPressed: tapRight,
                  child: Text(
                    LocaleKeys.Register.tr(),
                    style: TextStyle(color: Colors.black, fontSize: _size / 29, fontFamily: "WorkSansSemiBold"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
