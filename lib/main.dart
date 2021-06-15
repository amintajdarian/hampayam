import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hampayam_chat/StateManagement/ProfileProvider.dart';
import 'package:provider/provider.dart';

import 'Screen/LoginScreen.dart';
import 'StateManagement/ChatListProvider.dart';
import 'StateManagement/loginStateManagement/loginPageProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatListProvider()),
      ChangeNotifierProvider(create: (context) => LoginPageProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fa')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LoginScreen(),
    );
  }
}
