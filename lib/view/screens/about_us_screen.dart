import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vallino/http/about_us.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late Future whoAreWeFuture;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whoAreWeFuture = AboutUsServices.getAboutDetails(context);
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
                  Center(
                    child: CustomAssetsImage(SizeConfig.screenHeight*0.22,
                        SizeConfig.screenWidth * 0.92, "assets/image/about_us_1.png"
                    ),
                  ),
                  SizedBox(
                    height:responsiveHeight(10) ,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAssetsImage(responsiveHeight(80),
                          SizeConfig.screenWidth * 0.20, "assets/image/about_us_1.png"
                      ),
                      CustomAssetsImage(responsiveHeight(80),
                          SizeConfig.screenWidth * 0.20, "assets/image/about_us_1.png"
                      ),
                      CustomAssetsImage(responsiveHeight(80),
                          SizeConfig.screenWidth * 0.20, "assets/image/about_us_1.png"
                      ),
                      CustomAssetsImage(responsiveHeight(80),
                          SizeConfig.screenWidth * 0.20, "assets/image/about_us_1.png"
                      ),
                    ],
                  ),
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

                  CustomAssetsImage(SizeConfig.screenHeight * 0.2, SizeConfig.screenWidth * 0.9, "assets/image/about_us_map.png"),
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
        future: whoAreWeFuture,
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

}
