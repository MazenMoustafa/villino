import 'package:flutter/material.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/about_us_screen.dart';
import 'package:vallino/view/screens/guest_form_screen.dart';
import 'package:vallino/view/screens/home_screen.dart';
import 'package:vallino/view/screens/login_screen.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'view/screens/select_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Cairo"
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Main(),
      ),
    );
  }
}



class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SplashScreen();
  }
}


