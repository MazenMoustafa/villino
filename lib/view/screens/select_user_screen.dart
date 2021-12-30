import 'package:flutter/material.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  _SelectUserScreenState createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(

        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,

          child: Stack(

            children: [

              Container(
              width: double.infinity,
                alignment: Alignment.topCenter,
                padding:  EdgeInsets.only(top: responsiveHeight(100)),
                child: CustomAssetsImage(SizeConfig.screenHeight * 0.15,
                    SizeConfig.screenWidth * 0.68, "assets/image/logo.png"),
              ),

              Container(
                width: double.infinity,
                alignment: Alignment.center,
                // padding:  EdgeInsets.only(top: responsiveHeight(100)),
                child:    Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      child: CustomAssetsImage(SizeConfig.screenHeight * 0.1,
                          SizeConfig.screenWidth * 0.2, "assets/image/logo.png"),
                    ),
                    Container(

                      child: CustomAssetsImage(SizeConfig.screenHeight * 0.1,
                          SizeConfig.screenWidth * 0.2, "assets/image/logo.png"),
                    ),
                  ],
                ),

              ),
              // Container(
              //     decoration: BoxDecoration(
              //         image: DecorationImage(
              //             image: AssetImage("assets/image/background1.png"),
              //             fit: BoxFit.cover))
              // )

            ],

      ),
        )
        )
    );
  }
}
