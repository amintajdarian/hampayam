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
  String validateTextPhone;
  String validateTextUserName;
  String validateTextPassword;
  String validateTextName;
  bool isValidate = false;

  bool isValidatePhone = false;
  bool isValidateName = false;
  bool isValidatePassword = false;
  bool isValidateUserName = false;
  bool progressEnable = false;
  bool progressEnableSignUp = false;
  int counter = 0;
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
  bool get getTextConfirimEmpty => textConfirimEmpty;
  bool get getTextPhoneEmpty => textPhoneEmpty;
  bool get getIsValidate => isValidate;
  bool get getIsValidatePassword => isValidatePassword;
  bool get getIsValidatePhone => isValidatePhone;
  bool get getIsValidateUserName => isValidateUserName;
  bool get getIsValidateName => isValidateName;
  String get getValidateText => validateText;
  String get getValidateTextUserName => validateTextUserName;
  String get getValidateTextName => validateTextName;
  String get getValidateTextPassword => validateTextPassword;
  String get getValidateTextPhone => validateTextPhone;
  bool get getprogressEnable => progressEnable;
  bool get getprogressEnableSignUp => progressEnableSignUp;

  Color get getColorRight => right;
  Color get getColorLeft => left;
  int get getConter => counter;

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

  void increamentCounter() {
    counter++;
    notifyListeners();
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

  void changeIsVAlidatePassword(bool valid) {
    this.isValidatePassword = valid;
    notifyListeners();
  }

  void changeIsVAlidatePhone(bool valid) {
    this.isValidatePhone = valid;
    notifyListeners();
  }

  void changeIsVAlidateUserName(bool valid) {
    this.isValidateUserName = valid;
    notifyListeners();
  }

  void changeIsVAlidatName(bool valid) {
    this.isValidateName = valid;
    notifyListeners();
  }

  void changeValidateText(String textField) {
    if (textField.isNotEmpty) {
      this.validateText = textField;
      notifyListeners();
    }
  }

  void changeValidateTextPassword(String textField) {
    if (textField.isNotEmpty) {
      this.validateTextPassword = textField;
      notifyListeners();
    }
  }

  void changeValidateTextPhone(String textField) {
    if (textField.isNotEmpty) {
      this.validateTextPhone = textField;
      notifyListeners();
    }
  }

  void changeValidateTextUserName(String textField) {
    if (textField.isNotEmpty) {
      this.validateTextUserName = textField;
      notifyListeners();
    }
  }

  void changeValidateTextName(String textField) {
    if (textField.isNotEmpty) {
      this.validateTextName = textField;
      notifyListeners();
    }
  }

  void changeProgress(bool pr) {
    this.progressEnable = pr;
    notifyListeners();
  }

  void changeProgressSignUp(bool pr) {
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

  void reset() {
    obscureTextLogin = true;
    obscureTextSignup = true;
    obscureTextSignupConfirm = true;
    textUserNameEmpty = false;
    textPasswordEmpty = false;
    textRegNameEmpty = false;
    textRegUserNameEmpty = false;
    textRegPasswordEmpty = false;
    textConfirimEmpty = false;
    textPhoneEmpty = false;
    validateText = null;
    validateTextPhone = null;
    validateTextUserName = null;
    validateTextPassword = null;
    validateTextName = null;
    isValidate = false;

    isValidatePhone = false;
    isValidateName = false;
    isValidatePassword = false;
    isValidateUserName = false;
    progressEnable = false;
    progressEnableSignUp = false;
    counter = 0;
    right = null;
    left = null;
    notifyListeners();
  }
}
