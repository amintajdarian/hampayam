import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/Screen/HomeScreen.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/loginStateManagement/loginPageProvider.dart';
import 'package:hampayam_chat/widget/loginWidget/buttomIcon.dart';
import 'package:hampayam_chat/widget/loginWidget/buttonWidget.dart';
import 'package:hampayam_chat/widget/loginWidget/menuBar.dart';
import 'package:hampayam_chat/widget/loginWidget/textFileBuilder.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../translations/locale_keys.g.dart';
import 'dart:ui' as ui;

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FARSI = 'fa';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController loginUserNameController = new TextEditingController();

  TextEditingController loginPasswordController = new TextEditingController();

  TextEditingController signupPhoneController = new TextEditingController();

  TextEditingController signupNameController = new TextEditingController();

  TextEditingController signupUserNameController = new TextEditingController();

  TextEditingController signupPasswordController = new TextEditingController();

  TextEditingController signupConfirmPasswordController = new TextEditingController();

  PageController _pageController = PageController();

  Color left = Colors.black;

  Color right = Colors.white;

  bool loginSuccess = false;

  Widget spacebetween(var size) {
    return Container(
      width: (size / 2) * 1.2,
      height: (size / 300),
      color: Colors.grey[400],
    );
  }

  _showPopupMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 65.0, 24.0, 0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Row(
                children: [
                  Text(
                    "🇮🇷 Persian",
                    style: TextStyle(
                      color: HexColor("#694AE3"),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            value: '1'),
        PopupMenuItem<String>(
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Row(
                children: [
                  Text(
                    "🇺🇸 English",
                    style: TextStyle(
                      color: HexColor("#694AE3"),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            value: '2'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) async {
      if (itemSelected == null) return;
      //code here
      if (itemSelected == "1") {
        await context.setLocale(Locale('fa')); //code here
        //code here
      } else if (itemSelected == "2") {
        await context.setLocale(Locale('en'));
      } else {
        //code here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginPageProvider loginPageProvider = Provider.of<LoginPageProvider>(context);
    var _size = MediaQuery.of(context).size.width;
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: NotificationListener<OverscrollIndicatorNotification>(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //>= 775.0 ? MediaQuery.of(context).size.height : 900,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [HexColor('#CCFF90'), HexColor('#00E5FF')], begin: const FractionalOffset(0.0, 0.0), end: const FractionalOffset(1.0, 1.0), stops: [0.0, 1.0], tileMode: TileMode.clamp),
                ),
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: _size / 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _size / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(Icons.language),
                              onPressed: () {
                                _showPopupMenu(context);
                              }),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Image(

                          //width: 200.0,
                          //height: 140.0,
                          fit: BoxFit.fill,
                          image: new AssetImage('assets/images/logo-asli.png')),
                    ),
                    MenuBar(
                      tapLeft: _onSignInButtonPress,
                      tapRight: _onSignUpButtonPress,
                      pageController: _pageController,
                    ),
                    Expanded(
                      flex: _size < 1200 ? 5 : 1,
                      //flex: 5,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (i) {
                          if (i == 0) {
                            loginPageProvider.changeColorRight(Colors.white);
                            loginPageProvider.changeColorLeft(Colors.black);
                          } else if (i == 1) {
                            loginPageProvider.changeColorRight(Colors.black);
                            loginPageProvider.changeColorLeft(Colors.white);
                          }
                        },
                        children: <Widget>[
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildSignIn(context),
                          ),
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildSignUp(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSignIn(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;
    LoginPageProvider loginPageProvider = Provider.of<LoginPageProvider>(context);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    ChatListProvider chatListProvider = Provider.of<ChatListProvider>(context);
    return Container(
      //padding: EdgeInsets.only(top: 23.0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: _size / 10, left: _size / 10),
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFieldBuilder(
                          textEditingController: loginUserNameController,
                          iconData: Typicons.user_outline,
                          hintText: LocaleKeys.UserName.tr(),
                          obscureText: false,
                          suffixIconShow: false,
                          validateEmpty: loginPageProvider.getTextUserNameEmpty,
                          validateValue: loginPageProvider.getIsValidate,
                          errorValidate: loginPageProvider.getValidateText,
                        ),
                        spacebetween(_size),
                        TextFieldBuilder(
                          textEditingController: loginPasswordController,
                          hintText: LocaleKeys.Password.tr(),
                          iconData: MfgLabs.lock_alt,
                          obscureText: loginPageProvider.getObscureTextLogin,
                          suffixIconShow: true,
                          sufixIconData: loginPageProvider.getObscureTextLogin ? Elusive.eye_off : Elusive.eye,
                          pressFunction: () {
                            loginPageProvider.changeObscureTextLogin();
                          },
                          validateEmpty: loginPageProvider.getTextPasswordEmpty,
                          validateValue: loginPageProvider.getIsValidate,
                          errorValidate: loginPageProvider.getValidateText,
                        ),
                        SizedBox(
                          height: _size / 11,
                        )
                      ],
                    ),
                  ),
                ),
                ButtonWidget(
                  enableProgress: loginPageProvider.getprogressEnable,
                  mergin: .3,
                  hintText: LocaleKeys.Login.tr(),
                  pressFunction: () {
                    if (loginUserNameController.text.isNotEmpty && loginPasswordController.text.isNotEmpty) {
                      loginPageProvider.changeProgress(true);
                      signIn(context, loginUserNameController.text, loginPasswordController.text).then((value) {
                        IORouter.loginScreenChannel.stream.listen((event) async {
                          switch (event.type) {
                            case 'm':
                              JRcvMeta meta = JRcvMeta.fromJson(event.msg);

                              if (meta.hasSub()) {
                                if (meta.topic == 'me') {
                                  chatListProvider.clearData();
                                  meta.sub.sort((a, b) => b.touched.compareTo(a.touched));

                                  chatListProvider.listSpliter(meta.sub);
                                }
                              }
                              if (meta.hasDesc()) {
                                profileProvider.fname(meta.getDescription().getPublic().fn);
                                if (meta.getDescription().getPublic().photo != null) {
                                  if (meta.getDescription().getPublic().photo != null) {
                                    profileProvider.setPhoto(meta.getDescription().getPublic().photo.data);
                                  }
                                }
                                if (meta.desc.getPublic().n != null) {
                                  profileProvider.sname(meta.getDescription().getPublic().n.surname);
                                }
                              }
                              if (meta.hasCred()) {
                                profileProvider.setPhone(meta.getCredential(0).val);
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => HomeScreen(),
                                  ),
                                );
                              }

                              break;
                            case 'c':
                              JRcvCtrl ctrl = JRcvCtrl.fromJson(event.msg);

                              if (ctrl.code == 200 && ctrl.params != null) {
                                if (ctrl.params.token != null) {
                                  if (loginPageProvider.getConter == 0) {
                                    profileProvider.setToken(ctrl.params.token);
                                    HampayamClient.saveToken(ctrl.params.token);
                                    profileProvider.setUerName(ctrl.params.user);
                                    HampayamClient.subToMessanger();

                                    loginPageProvider.increamentCounter();
                                  }
                                }
                              } else if (ctrl.code == 401) {
                                loginPageProvider.changeIsVAlidate(true);
                                loginPageProvider.changeValidateText(ctrl.text);
                                loginPageProvider.changeProgress(false);
                              }
                              break;
                            default:
                          }
                        });
                      });
                      loginPageProvider.changeTextUserNameEmpty(loginUserNameController.text);
                      loginPageProvider.changeTextPasswordEmpty(loginPasswordController.text);
                    } else {
                      loginPageProvider.changeTextUserNameEmpty(loginUserNameController.text);
                      loginPageProvider.changeTextPasswordEmpty(loginPasswordController.text);
                      loginPageProvider.changeIsVAlidate(false);
                      loginPageProvider.changeValidateText('');
                      loginPageProvider.changeProgress(false);
                    }
                  },
                  hasPadding: false,
                ),
              ],
            ),
            SizedBox(
              height: _size / 12,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.Forgotpassword.tr(),
                style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: "WorkSansMedium"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    LocaleKeys.Or.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtomIcon(
                  iconData: FontAwesome5.facebook_f,
                ),
                ButtomIcon(
                  iconData: FontAwesome5.google,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    var _size = MediaQuery.of(context).size.width;
    LoginPageProvider loginPageProvider = Provider.of<LoginPageProvider>(context);

    return Container(
      //padding: EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: EdgeInsets.all(_size / 30),
        child: Column(
          children: <Widget>[
            Stack(
              //alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(right: _size / 10, left: _size / 10),
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          TextFieldBuilder(
                            textEditingController: signupNameController,
                            hintText: LocaleKeys.name.tr(),
                            obscureText: false,
                            suffixIconShow: false,
                            iconData: Icons.person,
                          ),
                          spacebetween(_size),
                          TextFieldBuilder(
                            textEditingController: signupUserNameController,
                            hintText: LocaleKeys.UserName.tr(),
                            iconData: Icons.person_outline,
                            suffixIconShow: false,
                            obscureText: false,
                          ),
                          spacebetween(_size),
                          TextFieldBuilder(
                            textEditingController: signupPhoneController,
                            hintText: LocaleKeys.Phone.tr(),
                            iconData: FontAwesome5.phone,
                            textInputType: TextInputType.phone,
                            suffixIconShow: false,
                            obscureText: false,
                          ),
                          spacebetween(_size),
                          TextFieldBuilder(
                            textEditingController: signupPasswordController,
                            hintText: LocaleKeys.Password.tr(),
                            iconData: MfgLabs.lock_alt,
                            suffixIconShow: true,
                            obscureText: loginPageProvider.getobscureTextSignup,
                            sufixIconData: loginPageProvider.getobscureTextSignup ? Elusive.eye_off : Elusive.eye,
                            pressFunction: () {
                              loginPageProvider.changeObscureTextSignup();
                            },
                          ),
                          spacebetween(_size),
                          TextFieldBuilder(
                            textEditingController: signupConfirmPasswordController,
                            hintText: LocaleKeys.ConfirmPass.tr(),
                            iconData: MfgLabs.lock_alt,
                            suffixIconShow: true,
                            obscureText: loginPageProvider.getobscureTextSignupConfirm,
                            sufixIconData: loginPageProvider.getobscureTextSignupConfirm ? Elusive.eye_off : Elusive.eye,
                            pressFunction: () => {loginPageProvider.changeObscureTextSignupConfirm()},
                          ),
                          SizedBox(
                            height: _size / 11,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ButtonWidget(
                  mergin: .75,
                  hintText: LocaleKeys.Register.tr(),
                  pressFunction: () {
                    SignUp();
                  },
                  hasPadding: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onSignInButtonPress() {
    _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  _onSignUpButtonPress() {
    _pageController?.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  String lJsonId;

  Future<void> signIn(BuildContext context, String username, String password) async {
    await HampayamClient.loginChat(IORouter.ipAddress, IORouter.apiKey, context.locale.toLanguageTag(), username, password);
  }

  Future<void> OnChatScreenEvent(MsgType msgType) async {}

  void OnChatChannelDone() {
    print('Chat Channel Done.');
  }

  void OnChatChannelError(Object e) {
    print('Chat Channel Error: ' + e.toString());
  }

  Future<void> SignUp() async {}

  Future<void> validateScreenEvent(MsgType msgType) async {}

  void vadlidateOnChatChannelDone() {
    print('Chat Channel Done.');
  }

  void validateOnChatChannelError(Object e) {
    print('Chat Channel Error: ' + e.toString());
  }
}
