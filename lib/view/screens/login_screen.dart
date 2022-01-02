import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallino/http/autherntication_services.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/home_screen.dart';
import 'package:vallino/view/screens/register_screen.dart';
import 'package:vallino/view/screens/select_user_screen.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController phoneContronller = TextEditingController();
  TextEditingController passwordContronller = TextEditingController();

  bool rememberMe = false;
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.registrationAppBar(
          "تسجيل الدخول", ColorResources.WHITE, ColorResources.PRIMARY_COLOR),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.155,
                ),
                Center(
                  child: Container(
                    child: Text(
                      "قم بتسجيل الدخول الأن",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(30),
                ),
                Form(
                    child: Column(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth * 0.9,
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                          EmailValidator(errorText: "هذا الحقل يجب أن يطابق مواصفات البريد الإلكتروني")
                        ]),
                        controller: phoneContronller,
                        decoration: decoration(
                            "البريد الإلكتروني",
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
                        validator: MinLengthValidator(8, errorText: "هذا الحقل يجب ان يتكون من 8 حروف أو أرقام"),
                        controller: passwordContronller,
                        obscureText: true,

                        decoration: decoration(
                            "كلمة المرور",
                            ColorResources.TF_TEXT_COLOR,
                            "assets/image/ic_lock.png"),
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(15),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rememberMeAcceptanceText(),

                        Text("هل نسيت كلمة المرور؟"),
                      ],
                    ),
                    SizedBox(
                      height: responsiveHeight(15),
                    ),
                    LongCustomSimpleTextButton("تسجيل الدخول", () {
                      onLoginClick();
                    }),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لديك حساب ؟", style: TextStyle(fontSize: 20)),
                        GestureDetector(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));},
                          child: Text(
                            "سجل الأن",
                            style: TextStyle(
                                color: ColorResources.PRIMARY_COLOR, fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // UI
  Widget rememberMeAcceptanceText() {
    Color getColor(Set<MaterialState> states) {
      return ColorResources.PRIMARY_COLOR;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: ColorResources.WHITE,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: rememberMe,
          onChanged: (bool? value) {
            setState(() {
              rememberMe = value!;
            }
            );
          },
        ),
        Text("تذكرني",style: TextStyle(fontSize: 15)),
      ],
    );
  }

  // Functions
  void onLoginClick(){
    AuthenticationServices.login(context, phoneContronller.text, passwordContronller.text).then((value){
      if(value != null){
        // Todo Store User Data
        SharedPreferences.getInstance().then((prefs){
          prefs.setString("token", value);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
        });

      }

    });
  }

  // Decoration
  InputDecoration decoration(String text, Color textColor, String dir) {
    return InputDecoration(
      //contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: text,
      labelStyle: TextStyle(color: textColor, height: 0.75),
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
