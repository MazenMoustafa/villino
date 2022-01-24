import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/http/qr_service.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

import 'package:path_provider/path_provider.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("زائر", style: TextStyle(color: ColorResources.WHITE,fontSize: 30),),
        centerTitle: true,
        backgroundColor: ColorResources.PRIMARY_COLOR,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              // color: ColorResources.WHITE,
              borderRadius: BorderRadius.vertical(top: Radius.circular(200.0)),
            ),
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
                key: formGlobalKey,
                child: Container(
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
                                RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
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
                          Container(
                            width: SizeConfig.screenWidth * 0.9,
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                LYDPhoneValidator(errorText: "هذا الحقل يجب أن يتكون من أرقام فقط")
                              ]),
                              controller: phoneContronller,
                              decoration: decoration(
                                  "رقم تليفون الزائر",
                                  ColorResources.TF_TEXT_COLOR,
                                  "assets/image/ic_phone.png"),
                            ),
                          ),
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
                                RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
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
                      SizedBox(
                        height: responsiveHeight(15),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: responsiveHeight(20)),
                          child: LongCustomSimpleTextButton(
                              "إصدار الكود", onScanClicked)),
                    ],
                  ),
                )),
            Container(
              width: SizeConfig.screenWidth,
              height: responsiveHeight(150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/image/background1.png"),
                ),
              ),
            ),
          ],
        ),
      ),
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

    if (picked != null) {
      String date = picked.day.toString() + "-" + picked.month.toString() + "-" + picked.year.toString();
      visitDateContronller.text = date;
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Functions
  void onScanClicked() {
    if (formGlobalKey.currentState!.validate()) {
      QRCodeServices.qr_type2(context, prefs.getInt("user_id")!, visitDateContronller.text)
          .then((value) {
        showQRCode(context, value!, 240).show();
      });
    }
  }

  Alert showQRCode(BuildContext context, String text, double size) {
    GlobalKey globalKey = new GlobalKey();
    File? file;
    return Alert(
      context: context,
      padding: EdgeInsets.zero,
      content: Container(
        height: SizeConfig.screenHeight * 0.4,
        width: SizeConfig.screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: globalKey,
              child: Container(
        color: ColorResources.WHITE,
                child: QrImage(
                  data: text,
                  version: QrVersions.auto,
                  size: size,
                  gapless: false,
                  // embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                  // embeddedImageStyle: QrEmbeddedImageStyle(
                  //   size: Size(80, 80),
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            CustomComplexTextButton(
                responsiveHeight(35),
                SizeConfig.screenWidth * 0.55,
                responsiveSize(50),
                "مشاركة",
                ColorResources.WHITE,
                ColorResources.PRIMARY_COLOR,
                responsiveSize(16), () async {
              // try {
              // RenderRepaintBoundary boundary =
              // globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
              // var image = await boundary.toImage(pixelRatio: 3.0);
              // ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
              // Uint8List? pngBytes = byteData?.buffer.asUint8List();
              // var bs64 = base64Encode(pngBytes!);
              //   await WcFlutterShare.share(
              //       sharePopupTitle: "",
              //       //subject: ,
              //       fileName: 'share.png',
              //       mimeType: 'image/png',
              //       bytesOfFile: pngBytes.buffer.asUint8List());
              // } catch (e) {
              //   print(e.toString());
              // }
              // }

              RenderRepaintBoundary boundary = globalKey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
//captures qr image
              var image = await boundary.toImage();

              ByteData? byteData =
                  await image.toByteData(format: ImageByteFormat.png);

              Uint8List pngBytes = byteData!.buffer.asUint8List();
//app directory for storing images.
              final appDir = await getApplicationDocumentsDirectory();
//current time
              var datetime = DateTime.now();
//qr image file creation
              file = await File('${appDir.path}/$datetime.png').create();
//appending data
              await file?.writeAsBytes(pngBytes);
//Shares QR image

              await Share.shareFiles(
                [file!.path],
                mimeTypes: ["image/png"],
                text: visitDateContronller.text  + "' للزيارة في التاريخ الموافق  " + prefs.getString("user_name")! + "'لديك دعوة من السيد ",
              );
            }),
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
