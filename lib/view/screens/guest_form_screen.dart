import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';

class GuetFormScreen extends StatefulWidget {
  const GuetFormScreen({Key? key}) : super(key: key);

  @override
  _GuetFormScreenState createState() => _GuetFormScreenState();
}

class _GuetFormScreenState extends State<GuetFormScreen> {
  TextEditingController nameContronller = TextEditingController();
  TextEditingController phoneContronller = TextEditingController();
  TextEditingController visitDateContronller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(

      appBar: AppBars.registrationAppBar("زائر", ColorResources.WHITE, ColorResources.PRIMARY_COLOR) ,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: responsiveHeight(60),
              ),


              Form(
                  child: Column(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: TextFormField(
                          //validator: ,
                          controller: nameContronller,
                          decoration: decoration("اسم الزائر", ColorResources.TF_TEXT_COLOR,"assets/image/ic_visitor_name.png"),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Row(
                          children: [
                            Container(
                              padding:  EdgeInsets.only(right: responsiveWidth(15)),
                              width: SizeConfig.screenWidth * 0.7,
                              child: TextFormField(
                                //validator: ,
                                controller: phoneContronller,
                                decoration: decoration("رقم تليفون الزائر", ColorResources.TF_TEXT_COLOR,"assets/image/ic_phone.png"),
                              ),
                            ),
                          ] ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: TextFormField(
                          //validator: ,
                          controller: visitDateContronller,
                          decoration: decoration("تاريخ الزيارة", ColorResources.TF_TEXT_COLOR,"assets/image/ic_visit_date.png"),
                        ),
                      ),


                      SizedBox(
                        height: SizeConfig.screenHeight*0.4,
                      ),


                      LongCustomSimpleTextButton("مسح الكود",(){}),


                    ],
                  )
              )
            ],
          ),
        ),

      ),
    );
  }

  // Decorations
  InputDecoration decoration(String text, Color textColor, String dir) {
    return InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears

      labelText: text,
      labelStyle: TextStyle(color: textColor, height: 0.75),
      fillColor: ColorResources.TF_FILL_COLOR,
      filled: true,
      prefixIconConstraints: BoxConstraints(
          minHeight: 30,
          minWidth: 30
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(right: responsiveWidth(16), left: responsiveWidth(8), bottom: responsiveHeight(10), ),
        child: Container(
          height: 30,
          width: 30,
          decoration:  BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(dir),
              )
          ),
        ),
      ),
    );
  }
}
