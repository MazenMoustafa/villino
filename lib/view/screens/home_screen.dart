import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.homeAppBar(context),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الأقسام الرئيسية", style: TextStyle(fontSize: responsiveSize(16)),),
            SizedBox(height: responsiveHeight(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionElement("دخول فالينو", "assets/image/home_enter.png", (){showQRCode(context, "HHHHHHHHHHHHHHH", 240).show();}),
                SizedBox(width: responsiveWidth(10),),
                sectionElement("الخدمات", "assets/image/home_services.png", null)
              ],
            ),
            SizedBox(height: responsiveHeight(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionElement("الاحداث و الفعاليات", "assets/image/home_events.png", null),
                SizedBox(width: responsiveWidth(10),),
                sectionElement("منتدي الأعضاء", "assets/image/home_forum.png", null)
              ],
            ),
          ],
        ),
      ),
    );
  }

  // UI
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
              Text(text, style: TextStyle(fontSize: responsiveSize(18)),)
            ],
          )
        ),
      ),
    );
  }

  Alert showQRCode(BuildContext context, String text, double size) {
    final CustomTimerController _controller = CustomTimerController();
    _controller.start();

    bool timeOut = false;
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
                QrImage(
                  data: text,
                  version: QrVersions.auto,
                  size: size,
                  gapless: false,
                  // embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                  // embeddedImageStyle: QrEmbeddedImageStyle(
                  //   size: Size(80, 80),
                  // ),
                ),
                SizedBox(height: responsiveHeight(10),),
                CustomTimer(
                  controller: _controller,
                  begin: Duration(seconds: 30),
                  end: Duration(),
                  onChangeState: (value){
                    if(value == CustomTimerState.finished)
                       setState(() { timeOut = true; });
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
                   _controller.reset();
                   _controller.start();
                   setState(() { timeOut = false; });
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


  //
}

