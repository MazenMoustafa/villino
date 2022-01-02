import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vallino/http/about_us_services.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/images/custom_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late Future aboutUsFuture;
  late Future imagesFuture;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutUsFuture = AboutUsServices.getAboutDetails(context);
    imagesFuture = AboutUsServices.getImages(context);
  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: responsiveHeight(10),horizontal: responsiveWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomAssetsImage(responsiveHeight(100),
                        SizeConfig.screenWidth * 0.5, "assets/image/splash_logo.png"
                    ),
                  ),
                  SizedBox(
                    height:responsiveHeight(20) ,
                  ),

                  renderImages(),

                  SizedBox(
                    height:responsiveHeight(10) ,
                  ),
                  Text("عن فالينو",style: TextStyle(fontSize: 25),),


                  renderAboutUsText(),
                  //Text("مثل العديد من المفاهيم الأخرى ، فإن المنتجع مصطلح يستخدم بشكل متكرر في لغتنا ، على الرغم من عدم التعرف عليه من قبل الأكاديمية الملكية الإسبانية ( RAE ). إنها كلمة إنجليزية تشير إلى مجمع سياحي .بشكل متكرر في لغتنا ، على الرغم من عدم التعرف عليه من قبل الأكاديمية الملكية الإسبانية ( RAE ). إنها كلمة إنجليزية تشير إلى مجمع سياحي"),

                  SizedBox(
                    height:responsiveHeight(5) ,
                  ),

                  Text("موقع فالينو",style: TextStyle(fontSize: 25),),

                  SizedBox(
                    height:responsiveHeight(5) ,
                  ),

                  // Container(
                  //     child: WebView(
                  //       initialUrl: Uri.dataFromString('<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3623.653110711322!2d46.6393623!3d24.7387867!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e2ee3356d0a8f25%3A0xf1957f950082e5b5!2z2YjYstin2LHYqSDYp9mE2KfYqti12KfZhNin2Kog2YjYqtmC2YbZitipINin2YTZhdi52YTZiNmF2KfYqg!5e0!3m2!1sar!2seg!4v1641045248050!5m2!1sar!2seg\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>').toString(),
                  //       javascriptMode: JavascriptMode.unrestricted,
                  //     )),

                  GestureDetector(
                      onTap: (){openMap();},
                      child: CustomAssetsImage(SizeConfig.screenHeight * 0.2, SizeConfig.screenWidth * 0.9, "assets/image/about_us_map.png")
                  ),
                  SizedBox(
                    height:responsiveHeight(10) ,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  // UI
  Widget renderAboutUsText() {
    return FutureBuilder(
        future: aboutUsFuture,
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else
            if (snapshot.hasError)
            return Text("Error");
          else {
            return Text(snapshot.data);
          }
        });
  }


  Widget renderImages() {
    return FutureBuilder(
        future: imagesFuture,
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else
          if (snapshot.hasError)
            return Text("Error");
          else {
            return Column(
              children: [
                Center(
                  child: CustomNetworkImage(SizeConfig.screenHeight*0.22,
                      SizeConfig.screenWidth * 0.92, snapshot.data[0].toString()
                  ),
                ),
                SizedBox(
                  height:responsiveHeight(10) ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNetworkImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.20, snapshot.data[0].toString()
                    ),
                    CustomNetworkImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.20, snapshot.data[1].toString()
                    ),
                    CustomNetworkImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.20, snapshot.data[2].toString()
                    ),
                    CustomNetworkImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.20, snapshot.data[3].toString()
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }

  // Function

  Future<void> openMap() async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=30.060734,31.220130';
    await launch(googleUrl);

  }

}
