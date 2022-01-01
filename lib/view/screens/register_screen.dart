import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController nameContronller = TextEditingController();
  TextEditingController phoneContronller = TextEditingController();
  TextEditingController familyMembersNumberContronller = TextEditingController();
  TextEditingController unitNumberContronller = TextEditingController();
  TextEditingController emailContronller = TextEditingController();
  TextEditingController passwordContronller = TextEditingController();


  bool terms = false;




  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorResources.WHITE,
      body: SafeArea(
        child:
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: responsiveHeight(20),
              ),
              CustomAssetsImage(responsiveHeight(125),
                  SizeConfig.screenWidth * 0.45, "assets/image/logo.png"),
              SizedBox(
                height: responsiveHeight(20),
              ),
              Form(
                  child: Column(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: TextFormField(
                          //validator: ,
                          controller: nameContronller,
                          decoration: decoration("الاسم كامل", ColorResources.TF_TEXT_COLOR),
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
                            decoration: decoration("رقم الهاتف", ColorResources.TF_TEXT_COLOR),
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
                          controller: familyMembersNumberContronller,
                          decoration: decoration("عدد أفراد الأسرة", ColorResources.TF_TEXT_COLOR),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: TextFormField(
                          //validator: ,
                          controller: unitNumberContronller,
                          decoration: decoration("رقم الوحدة", ColorResources.TF_TEXT_COLOR),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: TextFormField(
                          //validator: ,
                          controller: emailContronller,
                          decoration: decoration("الايميل", ColorResources.TF_TEXT_COLOR),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Container(
                        width: SizeConfig.screenWidth * 0.9,

                        child: TextFormField(
                          //validator: ,
                          controller: passwordContronller,
                          obscureText: true,
                          decoration: decoration("كلمة المرور", ColorResources.TF_TEXT_COLOR),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(("من خلال التسجيل معنا فإنك توافق علي كافة الشروط والسياسات"), style: TextStyle(fontSize: 15)
                          ),

                          // Checkbox(
                          //   checkColor: Colors.white,
                          //
                          //   //focusColor: ColorResources.PRIMARY_COLOR,
                          //   fillColor: MaterialStateProperty.resolveWith(getColor),
                          //   value: terms,
                          //   onChanged: (bool? value) {
                          //     setState(() {
                          //       terms = value!;
                          //     }
                          //     );
                          //   },
                          // ),

                        ],
                      ),

                      LongCustomSimpleTextButton("تسجيل الدخول",(){}),


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
  InputDecoration decoration(String text, Color textColor) {
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
    );
  }
}
