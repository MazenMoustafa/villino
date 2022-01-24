import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/http/qr_service.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/about_us_screen.dart';
import 'package:vallino/view/screens/select_user_screen.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/toasts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late SharedPreferences prefs;


  @override
  void initState() {
    initAwaits();
  }

  Future<void> initAwaits() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBars.homeAppBar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            carousel(),
            SizedBox(height: responsiveHeight(20),),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("الأقسام الرئيسية", style: TextStyle(fontSize: responsiveSize(16)),),
                  SizedBox(height: responsiveHeight(10),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sectionElement("دخول فالينو", "assets/image/home_enter.png", (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SelectUserScreen()));}), //
                      SizedBox(width: responsiveWidth(10),),
                      sectionElement("الخدمات", "assets/image/home_services.png", (){showToast(context, "سوف يتم تفعيل هذا القسم قريباً");})
                    ],
                  ),
                  SizedBox(height: responsiveHeight(10),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sectionElement("الاحداث و الفعاليات", "assets/image/home_events.png", (){showToast(context, "سوف يتم تفعيل هذا القسم قريباً");}),
                      SizedBox(width: responsiveWidth(10),),
                      sectionElement("عن فالينو", "assets/image/home_about.png", (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutUsScreen()));})
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // UI

  Widget carousel(){
    return Container(
      child: CarouselSlider(
          items: [
            Container(
              height: SizeConfig.screenHeight * 0.2,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                    image : DecorationImage(
                        image: AssetImage('assets/image/home_carousel.png'),
                        fit: BoxFit.fill)),
                  child: Container(
                    height: SizeConfig.screenHeight * 0.18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("افضل الخدمات مع أفضل الأماكن", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold),),
                                  Text("تمتع بأفضل الخدامات بأفضل الأسعار", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              CustomComplexTextButton(
                                  responsiveHeight(35), SizeConfig.screenWidth * 0.3, responsiveSize(50),
                                  "تصفح الان", ColorResources.BLACK, ColorResources.WHITE, responsiveSize(16), (){
                              })
                            ],
                          ),
                        ),
                        Container(
                          height: SizeConfig.screenHeight * 0.18,
                          width: SizeConfig.screenWidth * 0.4,
                          //image: DecorationImage(image: NetworkImage('http://127.0.0.1:8000/storage/app/public/' + ad.images[0]), fit: BoxFit.fill)
                            decoration: BoxDecoration(
                                color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                                image : DecorationImage(
                                    image: AssetImage('assets/image/home_carousel_2.png'),
                                    fit: BoxFit.fill))
                        ),

                      ],
                    ),
                  ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.2,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                  image : DecorationImage(
                      image: AssetImage('assets/image/home_carousel.png'),
                      fit: BoxFit.fill)),
              child: Container(
                height: SizeConfig.screenHeight * 0.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("افضل الخدمات مع أفضل الأماكن", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold),),
                              Text("تمتع بأفضل الخدامات بأفضل الأسعار", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          CustomComplexTextButton(
                              responsiveHeight(35), SizeConfig.screenWidth * 0.3, responsiveSize(50),
                              "تصفح الان", ColorResources.BLACK, ColorResources.WHITE, responsiveSize(16), (){
                          })
                        ],
                      ),
                    ),
                    Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.4,
                        //image: DecorationImage(image: NetworkImage('http://127.0.0.1:8000/storage/app/public/' + ad.images[0]), fit: BoxFit.fill)
                        decoration: BoxDecoration(
                            color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                            image : DecorationImage(
                                image: AssetImage('assets/image/home_carousel_2.png'),
                                fit: BoxFit.fill))
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.2,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                  image : DecorationImage(
                      image: AssetImage('assets/image/home_carousel.png'),
                      fit: BoxFit.fill)),
              child: Container(
                height: SizeConfig.screenHeight * 0.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("افضل الخدمات مع أفضل الأماكن", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold),),
                              Text("تمتع بأفضل الخدامات بأفضل الأسعار", style: TextStyle(color: ColorResources.WHITE, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          CustomComplexTextButton(
                              responsiveHeight(35), SizeConfig.screenWidth * 0.3, responsiveSize(50),
                              "تصفح الان", ColorResources.BLACK, ColorResources.WHITE, responsiveSize(16), (){
                          })
                        ],
                      ),
                    ),
                    Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.4,
                        //image: DecorationImage(image: NetworkImage('http://127.0.0.1:8000/storage/app/public/' + ad.images[0]), fit: BoxFit.fill)
                        decoration: BoxDecoration(
                            color: ColorResources.PRIMARY_COLOR.withOpacity(0),
                            image : DecorationImage(
                                image: AssetImage('assets/image/home_carousel_2.png'),
                                fit: BoxFit.fill))
                    ),

                  ],
                ),
              ),
            ),
          ],
          options: CarouselOptions(

            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1, // Full Width
            aspectRatio: 2.0,
            initialPage: 1,
          )
      ),
    );
  }

  Widget sectionElement(String text, String dir, VoidCallback? fun){
    return Expanded(
      child: InkWell(
        onTap: fun,
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(responsiveSize(10)),
            color: ColorResources.HOME_ELEMENT_FILL_COLOR,
          ),
          height: SizeConfig.screenHeight * 0.2,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: responsiveHeight(60),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  color: ColorResources.WHITE
                ),
                child: Center(
                  child: CustomAssetsImage(
                    responsiveHeight(30),
                    responsiveWidth(30),
                    dir
                  ),
                ),
              ),
              Text(text, style: TextStyle(fontSize: responsiveSize(15)),)
            ],
          )
        ),
      ),
    );
  }



  // Functions
  void getQRCode(){

  }

  //
}

