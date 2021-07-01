import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Ctrl.dart';
import 'package:hampayam_chat/Model/DeSeserilizedJson/Meta.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/loginStateManagement/loginPageProvider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  LoginPageProvider loginPageProvider;

  ProfileProvider profileProvider;
  ChatListProvider chatListProvider;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    IORouter.loginScreenChannel.stream.listen((onData));
    loginPageProvider = Provider.of(context, listen: false);
    chatListProvider = Provider.of(context, listen: false);
    profileProvider = Provider.of(context, listen: false);
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of(context);
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.blue.shade50,
        key: scaffoldKey,
        body: GestureDetector(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 30),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image(
                    image: new AssetImage('assets/images/logo-asli.png'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: widget.phoneNumber,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor:
                              hasError ? Colors.orange : Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(fontSize: 20, height: 1.6),
                        backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          HampayamClient.validateNumber(
                              profileProvider.token, v);
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: " RESEND",
                            recognizer: onTapRecognizer,
                            style: TextStyle(
                                color: Color(0xFF91D3B3),
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        formKey.currentState.validate();
                        // conditions for validating
                        if (currentText.length != 6) {
                          errorController.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          setState(() {
                            hasError = true;
                          });
                        } else {
                          setState(() {
                            hasError = false;
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Aye!!"),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        }
                      },
                      child: Center(
                          child: Text(
                        "VERIFY".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Clear"),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> onData(MsgType data) async {
    switch (data.type) {
      case 'm':
        JRcvMeta meta = JRcvMeta.fromJson(data.msg);

        if (meta.hasSub()) {
          if (meta.topic == 'me') {
            chatListProvider.clearData();

            meta.sub.sort((a, b) {
              if (a.touched != null && b.touched != null)
                return b.touched.compareTo(a.touched);
            });

            chatListProvider.listSpliter(meta.sub);
          }
        }
        if (meta.hasDesc()) {
          profileProvider.fname(meta.getDescription().getPublic().fn);
          if (meta.getDescription().getPublic().photo != null) {
            if (meta.getDescription().getPublic().photo != null) {
              profileProvider
                  .setPhoto(meta.getDescription().getPublic().photo.data);
            }
          }
          if (meta.desc.getPublic().n != null) {
            profileProvider.sname(meta.getDescription().getPublic().n.surname);
          }
        }
        if (meta.hasCred()) {
          profileProvider.setPhone(meta.getCredential(0).val);

          IORouter.activePage = 'home';
          Navigator.popAndPushNamed(context, '+');
          loginPageProvider.reset();
        }

        break;
      case 'c':
        JRcvCtrl ctrl = JRcvCtrl.fromJson(data.msg);

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
        } else {
          hasError = true;
          setState(() {});
        }

        break;
      default:
    }
  }
}
