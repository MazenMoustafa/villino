import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';

class GuetFormScreen extends StatefulWidget {
  const GuetFormScreen({Key? key}) : super(key: key);

  @override
  _GuetFormScreenState createState() => _GuetFormScreenState();
}

class _GuetFormScreenState extends State<GuetFormScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController nameContronller = TextEditingController();
  TextEditingController phoneContronller = TextEditingController();
  TextEditingController visitDateContronller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBars.registrationAppBar(
          "زائر", ColorResources.WHITE, ColorResources.PRIMARY_COLOR),
      body: Form(
          key: formGlobalKey,
          child: Container(
            //height: SizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: responsiveHeight(40),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.9,
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                        ]),
                        controller: nameContronller,
                        decoration: decoration(
                            "اسم الزائر",
                            ColorResources.TF_TEXT_COLOR,
                            "assets/image/ic_visitor_name.png"),
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(15),
                    ),
                    Row(children: [
                      Container(
                        padding:
                        EdgeInsets.only(right: responsiveWidth(15)),
                        width: SizeConfig.screenWidth * 0.7,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            LYDPhoneValidator(errorText: "Numbers")
                          ]),
                          controller: phoneContronller,
                          decoration: decoration(
                              "رقم تليفون الزائر",
                              ColorResources.TF_TEXT_COLOR,
                              "assets/image/ic_phone.png"),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: responsiveHeight(15),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.9,
                      child: TextFormField(
                        onTap: () {
                          _selectDate(context);
                        },
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                        ]),
                        readOnly: true,
                        controller: visitDateContronller,
                        decoration: decoration(
                            "تاريخ الزيارة",
                            ColorResources.TF_TEXT_COLOR,
                            "assets/image/ic_visit_date.png"),
                      ),
                    ),

                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: responsiveHeight(20)),
                    child: LongCustomSimpleTextButton(
                        "مسح الكود", onScanClicked)
                ),
              ],
            ),
          )),
    );
  }

  // UI
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: ColorResources.PRIMARY_COLOR,
              colorScheme:
              ColorScheme.light(primary: ColorResources.PRIMARY_COLOR),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate) {
      String date = selectedDate.day.toString() +
          "-" +
          selectedDate.month.toString() +
          "-" +
          selectedDate.year.toString();
      visitDateContronller.text = date;
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Functions
  void onScanClicked() {
    if (formGlobalKey.currentState!.validate()) {
      showQRCode(context, "Hellloooooooooooo", 240).show();
    }
  }

  Alert showQRCode(BuildContext context, String text, double size) {
    log("Alert");
    return Alert(
      context: context,
      padding: EdgeInsets.zero,
      content: Container(
        height: SizeConfig.screenHeight * 0.4,
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
            CustomComplexTextButton(
                responsiveHeight(35), SizeConfig.screenWidth * 0.55, responsiveSize(50),
                "مشاركة", ColorResources.WHITE, ColorResources.PRIMARY_COLOR, responsiveSize(16), (){})
          ],
        ),
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


  // Decorations
  InputDecoration decoration(String text, Color textColor, String dir) {
    return InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: text,
      labelStyle: TextStyle(color: textColor),
      fillColor: ColorResources.TF_FILL_COLOR,
      filled: true,
      prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 30),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          right: responsiveWidth(16),
          left: responsiveWidth(8),
          bottom: responsiveHeight(10),
        ),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(dir),
              )),
        ),
      ),
    );
  }
}

