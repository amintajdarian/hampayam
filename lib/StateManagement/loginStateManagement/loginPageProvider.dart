import 'package:flutter/cupertino.dart';

class LoginPageProvider extends ChangeNotifier {
  bool obscureTextLogin = true;
  bool obscureTextSignup = true;
  bool obscureTextSignupConfirm = true;
  bool textUserNameEmpty = false;
  bool textPasswordEmpty = false;
  bool textRegNameEmpty = false;
  bool textRegUserNameEmpty = false;
  bool textRegPasswordEmpty = false;
  bool textConfirimEmpty = false;
  bool textPhoneEmpty = false;
  String validateText;
  bool isValidate = false;
  bool progressEnable = false;

  Color right;
  Color left;

  bool get getObscureTextLogin => obscureTextLogin;
  bool get getobscureTextSignup => obscureTextSignup;
  bool get getobscureTextSignupConfirm => obscureTextSignupConfirm;
  bool get getTextUserNameEmpty => textUserNameEmpty;
  bool get getTextPasswordEmpty => textPasswordEmpty;
  bool get getTextRegNameEmpty => textRegNameEmpty;
  bool get getTextRegUserNameEmpty => textRegUserNameEmpty;
  bool get getTextRegPasswordEmpty => textRegPasswordEmpty;
  bool get getTextConfirimEmpty => textRegPasswordEmpty;
  bool get getTextPhoneEmpty => textRegPasswordEmpty;
  bool get getIsValidate => isValidate;
  String get getValidateText => validateText;
  bool get getprogressEnable => progressEnable;

  Color get getColorRight => right;
  Color get getColorLeft => left;

  void changeObscureTextLogin() {
    this.obscureTextLogin = !this.getObscureTextLogin;
    notifyListeners();
  }

  void validateEmptyUserName(String textField) {
    notifyListeners();
  }

  void changeObscureTextSignup() {
    this.obscureTextSignup = !this.getobscureTextSignup;
    notifyListeners();
  }

  void changeObscureTextSignupConfirm() {
    this.obscureTextSignupConfirm = !this.obscureTextSignupConfirm;
    notifyListeners();
  }

  void changeTextUserNameEmpty(String textField) {
    if (textField.isEmpty) {
      textUserNameEmpty = true;
      notifyListeners();
    } else {
      textUserNameEmpty = false;
      notifyListeners();
    }
  }

  void changeTextPasswordEmpty(String textField) {
    if (textField.isEmpty) {
      textPasswordEmpty = true;
      notifyListeners();
    } else {
      textPasswordEmpty = false;
      notifyListeners();
    }
  }

  void changeTextRegNameEmpty(String textField) {
    if (textField.isEmpty) {
      textRegNameEmpty = true;
      notifyListeners();
    } else {
      textRegNameEmpty = false;
      notifyListeners();
    }
  }

  void changeTextRegUserNameEmpty(String textField) {
    if (textField.isEmpty) {
      textRegUserNameEmpty = true;
      notifyListeners();
    } else {
      textRegUserNameEmpty = false;
      notifyListeners();
    }
  }

  void changeTextRegPasswordEmpty(String textField) {
    if (textField.isEmpty) {
      textRegPasswordEmpty = true;
      notifyListeners();
    } else {
      textRegPasswordEmpty = false;
      notifyListeners();
    }
  }

  void changeTextConfirimEmpty(String textField) {
    if (textField.isEmpty) {
      textConfirimEmpty = true;
      notifyListeners();
    } else {
      textConfirimEmpty = false;
      notifyListeners();
    }
  }

  void changeTextPhoneEmpty(String textField) {
    if (textField.isEmpty) {
      textPhoneEmpty = true;
      notifyListeners();
    } else {
      textPhoneEmpty = false;
      notifyListeners();
    }
  }

  void changeIsVAlidate(bool valid) {
    this.isValidate = valid;
    notifyListeners();
  }

  void changeValidateText(String textField) {
    if (textField.isNotEmpty) {
      this.validateText = textField;
      notifyListeners();
    }
  }

  void changeProgress(bool pr) {
    this.progressEnable = pr;
    notifyListeners();
  }

  void changeColorRight(Color color) {
    this.right = color;
    notifyListeners();
  }

  void changeColorLeft(Color color) {
    this.left = color;
    notifyListeners();
  }
}
