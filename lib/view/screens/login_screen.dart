import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBars.registrationAppBar("تسجيل الدخول", ColorResources.WHITE, ColorResources.PRIMARY_COLOR) ,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight*0.155,
              ),

              Center(

                child: Container(
                  child:Text("قم بتسجيل الدخول الأن",style: TextStyle(fontSize: 20),),
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
                          //validator: ,
                          controller: phoneContronller,
                          decoration: decoration("رقم الهاتف", ColorResources.TF_TEXT_COLOR,"assets/image/ic_visitor_name.png"),
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

                          decoration: decoration("كلمة المرور", ColorResources.TF_TEXT_COLOR,"assets/image/ic_lock.png"),
                        ),
                      ),


                      SizedBox(
                        height: responsiveHeight(15),
                      ),

                  Row(
                    children: [
                      Container(
                        child: Text("نذكرني"),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.55,
                      ),
                      Container(
                        child: Text("هل نسيت كلمة المرور"),
                      ),

                    ],
                  ),
                      SizedBox(
                        height: responsiveHeight(15),
                      ),
                      LongCustomSimpleTextButton("تسجيل الدخول",(){}
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight*0.1,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ليس لديك حساب ؟",style: TextStyle(fontSize: 20 )),
                          Text("سجل الأن",style: TextStyle(color:ColorResources.PRIMARY_COLOR,fontSize: 20 ),)
                        ],
                      )


                    ],
                  )
              )
            ],
          ),
        ),

      ),
    );
  }

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
