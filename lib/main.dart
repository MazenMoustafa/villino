import 'package:flutter/material.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/screens/splash_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Main()
        ),
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
    return RegisterScreen();
  }
}


