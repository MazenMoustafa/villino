import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/http/qr_service.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/guest_form_screen.dart';
import 'package:vallino/view/screens/home_screen.dart';
import 'package:vallino/view/screens/login_screen.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  _SelectUserScreenState createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GuetFormScreen()));
                                  }, // needed
                                  child: Container(
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
                                            CustomAssetsImage(
                                                responsiveHeight(55),
                                                responsiveWidth(50),
                                                "assets/image/ic_guest.png"),
                                            Text(
                                              "زائر",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: responsiveWidth(10),
                                ),
                                // Member
                                InkWell(
                                  onTap: () {
                                    showQRCode(context).then((value) => value.show());
                                  },
                                  child: Container(
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
                                            CustomAssetsImage(
                                                responsiveHeight(55),
                                                responsiveWidth(50),
                                                "assets/image/ic_member.png"),
                                            Text(
                                              "عضو",
                                              style: TextStyle(
                                                  color: ColorResources.WHITE,
                                                  fontSize: 20),
                                            ),
                                          ]),
                                    ),
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

  Future<Alert> showQRCode(BuildContext context) async {
    final CustomTimerController _controller = CustomTimerController();
    _controller.start();

    bool timeOut = false;
    String? qrText = await QRCodeServices.qr_type1(context, prefs.getInt("user_id")!);

    bool isVisible = true;

    return Alert(
      context: context,
      padding: EdgeInsets.zero,
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return Container(
              height: SizeConfig.screenHeight * 0.5,
              width: SizeConfig.screenWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isVisible,
                    child: QrImage(
                      data: qrText!,
                      version: QrVersions.auto,
                      size: 240,
                      gapless: false,
                      // embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                      // embeddedImageStyle: QrEmbeddedImageStyle(
                      //   size: Size(80, 80),
                      // ),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(10),),
                  CustomTimer(
                    controller: _controller,
                    begin: Duration(seconds: 30),
                    end: Duration(),
                    onChangeState: (value){
                      if(value == CustomTimerState.finished)
                        setState(() {
                          isVisible = false;
                          timeOut = true;
                        });
                    },
                    builder: (remaining) {
                      return CustomComplexTextButton(
                          responsiveHeight(35), SizeConfig.screenWidth * 0.55, responsiveSize(50),
                          "${remaining.seconds}.${remaining.milliseconds}",
                          ColorResources.BLACK, ColorResources.LIGHT_GREY, responsiveSize(16), (){});
                    },
                  ),
                  SizedBox(height: responsiveHeight(10),),
                  timeOut == true?
                  CustomComplexTextButton(
                      responsiveHeight(35), SizeConfig.screenWidth * 0.55, responsiveSize(50),
                      "إعادة إصدار", ColorResources.BLACK, ColorResources.PRIMARY_COLOR, responsiveSize(16), (){

                    QRCodeServices.qr_type1(context, prefs.getInt("user_id")!).then((value){
                      _controller.reset();
                      _controller.start();
                      qrText = value;
                      isVisible = true;
                      timeOut = false;
                      setState(() {

                      });
                    });

                  }) : Container()
                ],
              ),
            );
          }
      ),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isOverlayTapDismiss: true,
        // Close when tap outside the alert
        alertPadding: EdgeInsets.zero,
        // Internal Padding
        buttonAreaPadding: EdgeInsets.zero,
        // Internal Padding
        isCloseButton: false,
        // Close Button
        isButtonVisible: false,
        // Close Button

        descTextAlign: TextAlign.center,

        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsiveSize(20)),
          side: BorderSide(color: Colors.white, width: 1.5),
        ),
        overlayColor:
        Color(0x55000000).withOpacity(0.5), // Alert Background color
        //alertElevation: 0,
      ),
    );
  }
}

