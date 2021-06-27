import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TextFieldBuilder extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData iconData;
  final String hintText;
  final bool obscureText;
  final Function pressFunction;
  final bool suffixIconShow;
  final IconData sufixIconData;
  final TextInputType textInputType;
  final bool validateEmpty;
  final bool validateValue;
  final String errorValidate;
  final Function(String) onchange;
  TextFieldBuilder(
      {this.textEditingController,
      this.iconData,
      this.hintText,
      this.obscureText,
      this.pressFunction,
      this.suffixIconShow,
      this.sufixIconData,
      this.textInputType,
      this.validateEmpty,
      this.validateValue,
      this.errorValidate,
      this.onchange});
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: _size / 11),
      height: _size / 7,
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          onChanged: onchange,
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: textInputType != null ? textInputType : TextInputType.text,
          style: TextStyle(
              fontFamily: "WorkSansSemiBold",
              fontSize: _size / 25,
              color: validateEmpty
                  ? Colors.red
                  : validateValue
                      ? Colors.purple
                      : Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: validateEmpty
                ? TextStyle(color: Colors.red)
                : validateValue
                    ? TextStyle(color: Colors.purple, fontSize: 16)
                    : null,
            errorText: validateEmpty
                ? LocaleKeys.Fill.tr()
                : validateValue
                    ? errorValidate
                    : null,
            icon: Icon(
              iconData,
              color: Colors.black,
              size: _size / 20,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: _size / 25,
                color: validateEmpty
                    ? Colors.red
                    : validateValue
                        ? Colors.purple
                        : Colors.grey),
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
