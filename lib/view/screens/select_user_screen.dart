import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
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
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          SizedBox(
            height: responsiveHeight(75),
          ),
          Container(
            child: CustomAssetsImage(SizeConfig.screenHeight * 0.15,
                SizeConfig.screenWidth * 0.68, "assets/image/logo.png"),
          ),
          SizedBox(
            height: responsiveHeight(100),
          ),

          Container(
            width: double.infinity,
            // alignment: Alignment.center,
            // padding:  EdgeInsets.only(top: responsiveHeight(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                 width:SizeConfig.screenWidth*0.4,
                  height: SizeConfig.screenHeight*0.2,

                  decoration: BoxDecoration(
                      color: ColorResources.DARK_GREY,

                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [InkWell(
                        onTap: () => "myOnTap", // needed
                        child: CustomAssetsImage(SizeConfig.screenHeight * 0.1,
                            SizeConfig.screenWidth * 0.15, "assets/image/ic_guest.png"),
                      ),
                        Text("زائر",style: TextStyle(fontSize: 20),),
                      ]
                    ),
                  ),
                ),
                SizedBox(
                  width: responsiveWidth(10),
                ),
                Container(
                  width:SizeConfig.screenWidth*0.4,
                  height: SizeConfig.screenHeight*0.2,

                  decoration: BoxDecoration(
                      color: ColorResources.PRIMARY_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children:[ InkWell(
                        onTap: () => "myOnTap", // needed
                        child: CustomAssetsImage(SizeConfig.screenHeight * 0.1,
                            SizeConfig.screenWidth * 0.15, "assets/image/ic_member.png"),


                      ),Text("عضو", style: TextStyle(color: ColorResources.WHITE,fontSize: 20),),
                      ]
                    ),
                  ),
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
    )));
  }
}
