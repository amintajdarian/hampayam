import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hampayam_chat/StateManagement/ContactStateManagment/ContactProvider.dart';
import 'package:hampayam_chat/StateManagement/CreateChannelProvider/CreateChannelProvider.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/statusUserProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/pageChangeProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/AddMemberProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/ChlProvder.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/GrpProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/P2pProvider.dart';
import 'package:hampayam_chat/StateManagement/chatStateManagement/chatButtonProvide.dart';

import 'package:provider/provider.dart';

import 'Screen/HomeScreen.dart';
import 'Screen/LoginScreen/LoginScreen.dart';
import 'StateManagement/HomeStateManagement/ChatListProvider.dart';
import 'StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'StateManagement/loginStateManagement/loginPageProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final storage = new FlutterSecureStorage();
  String value = await storage.read(key: 'token') ?? null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatListProvider()),
      ChangeNotifierProvider(create: (context) => LoginPageProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => PageChangeProvider()),
      ChangeNotifierProvider(create: (context) => StatusUserProvider()),
      ChangeNotifierProvider(create: (context) => ContactProvide()),
      ChangeNotifierProvider(create: (context) => CreateGrpProvider()),
      ChangeNotifierProvider(create: (context) => CreateChannelProvider()),
      ChangeNotifierProvider(create: (context) => P2pProvider()),
      ChangeNotifierProvider(create: (context) => ChatButtonProvider()),
      ChangeNotifierProvider(create: (context) => ChlProvider()),
      ChangeNotifierProvider(create: (context) => GrpProvider()),
      ChangeNotifierProvider(create: (context) => AddMemberProvider()),
    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fa')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: value != null
            ? MyApp(
                navigate: '+',
              )
            : MyApp(
                navigate: '/',
              )),
  ));
}

class MyApp extends StatelessWidget {
  final String navigate;
  MyApp({this.navigate});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: navigate,
      routes: {
        '/': (context) => LoginScreen(),
        '+': (context) => HomeScreen(),
      },
      locale: context.locale,
    );
  }
}
