import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldBuilder extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData iconData;
  final String hintText;
  final bool obscureText;
  final Function pressFunction;
  final bool suffixIconShow;
  final IconData sufixIconData;
  final TextInputType textInputType;
  TextFieldBuilder({this.textEditingController, this.iconData, this.hintText, this.obscureText, this.pressFunction, this.suffixIconShow, this.sufixIconData, this.textInputType});
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: _size / 11),
      height: _size / 7,
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: textInputType != null ? textInputType : TextInputType.text,
          style: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: _size / 25, color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              iconData,
              color: Colors.black,
              size: _size / 20,
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: _size / 25),
            suffixIcon: suffixIconShow
                ? Padding(
                    padding: EdgeInsets.only(right: _size / 20),
                    child: IconButton(
                      icon: Icon(
                        sufixIconData,
                        size: _size / 25,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        pressFunction();
                      },
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
