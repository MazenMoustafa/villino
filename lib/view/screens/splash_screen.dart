import 'package:flutter/material.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
            width: double.infinity,
              height: SizeConfig.screenHeight,
              child:Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Container(

                  ),

                  CustomAssetsImage(SizeConfig.screenHeight * 0.15,
                      SizeConfig.screenWidth * 0.68, "assets/image/splash_logo.png"),
                  Padding(
                    padding:  EdgeInsets.only(bottom: responsiveHeight(30)),
                    child: CustomAssetsImage(SizeConfig.screenHeight * 0.1,
                        SizeConfig.screenWidth * 0.35, "assets/image/splash_footer.png"),
                  ),
                ],
              )

          )

        )
    );
  }


}
