import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/guest_form_screen.dart';
import 'package:vallino/view/screens/login_screen.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: responsiveHeight(75),
                          ),
                          // Logo
                          Container(
                            child: CustomAssetsImage(
                                SizeConfig.screenHeight * 0.15,
                                SizeConfig.screenWidth * 0.68,
                                "assets/image/logo.png"),
                          ),

                          // Body
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
                                // Guest
                                Container(
                                  width: SizeConfig.screenWidth * 0.4,
                                  height: SizeConfig.screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                      color: ColorResources.LIGHT_GREY,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GuetFormScreen()));
                                            }, // needed
                                            child: CustomAssetsImage(
                                                responsiveHeight(55),
                                                responsiveWidth(50),
                                                "assets/image/ic_guest.png"),
                                          ),
                                          Text(
                                            "زائر",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  width: responsiveWidth(10),
                                ),
                                // Member
                                Container(
                                  width: SizeConfig.screenWidth * 0.4,
                                  height: SizeConfig.screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                      color: ColorResources.PRIMARY_COLOR,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                                            }, // needed
                                            child: CustomAssetsImage(
                                                responsiveHeight(55),
                                                responsiveWidth(50),
                                                "assets/image/ic_member.png"),
                                          ),
                                          Text(
                                            "عضو",
                                            style: TextStyle(
                                                color: ColorResources.WHITE,
                                                fontSize: 20),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                  ),
                  Container(
                    height: responsiveHeight(150),
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/image/background1.png"),
                              fit: BoxFit.cover))
                  )
                ],
              ),
            )));
  }
}

