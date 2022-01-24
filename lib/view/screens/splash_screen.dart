import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/home_screen.dart';
import 'package:vallino/view/screens/login_screen.dart';
import 'package:vallino/view/screens/select_user_screen.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAwaits();
  }

  Future<void> initAwaits() async {
    prefs = await SharedPreferences.getInstance();
    navigate();

    setState(() {

    });

  }

  void navigate(){
    Timer(Duration(seconds: 3), () {
      if(prefs.containsKey("token"))
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      else
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
              height: SizeConfig.screenHeight,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    width: SizeConfig.screenWidth * 0.68,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/splash_logo.png"),
                      )
                    ),
                  ),
                  Column(
                    children: [
                      Text("Powered By Ivas", style: TextStyle(fontSize: 12),),
                      Padding(
                        padding:  EdgeInsets.only(bottom: responsiveHeight(20)),
                        child: Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.13,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/image/splash_footer.png"),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )

          )

        )
    );
  }


}
