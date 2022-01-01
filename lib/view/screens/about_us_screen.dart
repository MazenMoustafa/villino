import 'package:flutter/material.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
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
                Center(
                  child: CustomAssetsImage(SizeConfig.screenHeight*0.22,
                      SizeConfig.screenWidth * 0.92, "assets/image/about_us_1.png"
                  ),
                ),
                SizedBox(
                  height:responsiveHeight(10) ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAssetsImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.21, "assets/image/about_us_1.png"
                    ),
                    SizedBox(
                      width:responsiveWidth(10) ,
                    ),
                    CustomAssetsImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.21, "assets/image/about_us_1.png"
                    ),
                    SizedBox(
                      width:responsiveWidth(10) ,
                    ),
                    CustomAssetsImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.21, "assets/image/about_us_1.png"
                    ),
                    SizedBox(
                      width:responsiveWidth(10) ,
                    ),
                    CustomAssetsImage(responsiveHeight(80),
                        SizeConfig.screenWidth * 0.21, "assets/image/about_us_1.png"
                    ),
                  ],
                ),
                SizedBox(
                  height:responsiveHeight(10) ,
                ),
                Text("عن فالينو",style: TextStyle(fontSize: 25),),



                Text("مثل العديد من المفاهيم الأخرى ، فإن المنتجع مصطلح يستخدم بشكل متكرر في لغتنا ، على الرغم من عدم التعرف عليه من قبل الأكاديمية الملكية الإسبانية ( RAE ). إنها كلمة إنجليزية تشير إلى مجمع سياحي .بشكل متكرر في لغتنا ، على الرغم من عدم التعرف عليه من قبل الأكاديمية الملكية الإسبانية ( RAE ). إنها كلمة إنجليزية تشير إلى مجمع سياحي"),

                SizedBox(
                  height:responsiveHeight(5) ,
                ),

                Text("موقع فالينو",style: TextStyle(fontSize: 25),),
              ],
            ),
          ),
        )
    );
  }
}
