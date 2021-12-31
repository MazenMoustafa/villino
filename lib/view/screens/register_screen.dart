import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController nameContronller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
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
                          decoration: decoration("الأسم", ColorResources.TF_TEXT_COLOR),
                        ),
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

  // UI
  PreferredSizeWidget renderAppBar() {
    return AppBar(
      title: Text("سجيل الدخول"),
      centerTitle: true,
      backgroundColor: ColorResources.PRIMARY_COLOR,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.vertical(top: Radius.circular(200.0)),
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
