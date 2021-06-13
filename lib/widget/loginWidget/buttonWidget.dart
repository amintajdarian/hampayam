import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonWidget extends StatelessWidget {
  final String hintText;
  final Future pressFunction;
  final bool hasPadding;
  final double mergin;
  ButtonWidget({this.mergin, this.hintText, this.pressFunction, this.hasPadding});
  @override
  Widget build(Object context) {
    var _size = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: _size * mergin),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: HexColor('#01D7BE'),
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
            BoxShadow(
              color: HexColor('#0BA9B2'),
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
          gradient: new LinearGradient(
              colors: [HexColor('#01D7BE'), HexColor('#0BA9B2')], begin: const FractionalOffset(0.2, 0.2), end: const FractionalOffset(1.0, 1.0), stops: [0.0, 1.0], tileMode: TileMode.clamp),
        ),
        child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: HexColor('#01D7BE'),
          child: Container(
            width: _size / 3,
            height: _size / 10,
            child: hasPadding
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      hintText,
                      style: TextStyle(color: Colors.white, fontSize: _size / 20, fontFamily: "WorkSansBold"),
                    ),
                  )
                : Center(
                    child: Text(
                      hintText,
                      style: TextStyle(color: Colors.white, fontSize: _size / 20, fontFamily: "WorkSansBold"),
                    ),
                  ),
          ),
          onPressed: () async {
            await pressFunction;
          },
        ),
      ),
    );
  }
}
