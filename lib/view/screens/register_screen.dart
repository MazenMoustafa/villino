import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vallino/http/autherntication_services.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/screens/login_screen.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';
import 'package:vallino/view/shared/buttons/text_button.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';
import 'package:vallino/view/shared/phone_state_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formGlobalKey = GlobalKey<FormState>();

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
      backgroundColor: ColorResources.WHITE,
      body: SafeArea(
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              // Body
              Padding(
                padding: EdgeInsets.symmetric(vertical: responsiveHeight(15.0), horizontal: SizeConfig.screenWidth*0.05),
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
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            Container(
                              height: responsiveHeight(65),
                              width: SizeConfig.screenWidth * 0.9,
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً")
                                ]),
                                controller: nameContronller,
                                decoration: decoration("الاسم كامل", ColorResources.TF_TEXT_COLOR),
                              ),
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: responsiveHeight(65),
                                    width: SizeConfig.screenWidth * 0.70,
                                    child: TextFormField(
                                      validator: MultiValidator([
                                        RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                        LYDPhoneValidator(errorText: "هذا الحقل يجب أن يتكون من أرقام فقط")
                                      ]),
                                      controller: phoneContronller,
                                      decoration: decoration("رقم الهاتف", ColorResources.TF_TEXT_COLOR),
                                    ),
                                  ),
                                  Container(
                                      width: SizeConfig.screenWidth * 0.19,
                                      child: PhoneStatePicker()
                                  )
                                ]
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            Container(
                              height: responsiveHeight(65),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                  LYDPhoneValidator(errorText: "هذا الحقل يجب أن يتكون من أرقام فقط")
                                ]),
                                controller: familyMembersNumberContronller,
                                decoration: decoration("عدد أفراد الأسرة", ColorResources.TF_TEXT_COLOR),
                              ),
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            Container(
                              height: responsiveHeight(65),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                ]),
                                controller: unitNumberContronller,
                                decoration: decoration("رقم الوحدة", ColorResources.TF_TEXT_COLOR),
                              ),
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            Container(
                              height: responsiveHeight(65),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                  EmailValidator(errorText: "هذا الحقل يجب أن يطابق مواصفات البريد الإلكتروني")
                                ]),
                                controller: emailContronller,
                                decoration: decoration("الايميل", ColorResources.TF_TEXT_COLOR),
                              ),
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            Container(
                              height: responsiveHeight(65),

                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "هذا الحقل يجب الا يترك فارغاً"),
                                  MinLengthValidator(8, errorText:  '8 min length'),
                                ]),
                                controller: passwordContronller,
                                obscureText: true,
                                decoration: decoration("كلمة المرور", ColorResources.TF_TEXT_COLOR),
                              ),
                            ),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),

                            TermsAcceptanceText(),

                            SizedBox(
                              height: responsiveHeight(15),
                            ),
                            LongCustomSimpleTextButton("تسجيل الدخول",onRegisterClicked),
                          ],
                        )
                    )
                  ],
                ),
              ),
              // Background Image
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
      ),
    );
  }

  // UI
  Widget TermsAcceptanceText() {
    Color getColor(Set<MaterialState> states) {
      return ColorResources.PRIMARY_COLOR;
    }

    return FormField(
        builder: (FormFieldState<Object> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    checkColor: ColorResources.WHITE,


                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: terms,
                    onChanged: (bool? value) {
                      setState(() {
                        terms = value!;
                      }
                      );
                    },
                  ),
                  Flexible(child: Text("من خلال التسجيل معنا فإنك توافق علي كافة الشروط والسياسات",style: TextStyle(fontSize: 15))),
                ],
              ),
              state.hasError?
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0, top: responsiveHeight(10)),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                      color: Colors.redAccent,
                      height: 0.5,
                      fontSize: responsiveSize(11)
                  ),
                ),
              ) :
              Container()
            ],
          );
        },
        validator: (value) {
          if(terms == false)
            return "الرجاء الموافقة علي الشروط و الأحكام لإكمال عملية التسجيل";
        }

    );
  }

  // Functions
  void onRegisterClicked(){
    if(formGlobalKey.currentState!.validate()){
      AuthenticationServices.register(context, nameContronller.text, emailContronller.text,
          phoneContronller.text, passwordContronller.text,
          27, int.parse(familyMembersNumberContronller.text), int.parse(unitNumberContronller.text) , 131665).then((value){
            if(value == true)
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      });
    }
  }


  // Decorations
  InputDecoration decoration(String text, Color textColor) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)), // The Content PAdding gets changed when an error appears
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: text,
        labelStyle: TextStyle(color: textColor,  fontSize: 12),
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

class LYDPhoneValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  LYDPhoneValidator({String errorText = 'enter a valid LYD phone number'}) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    // return true if the value is valid according the your condition
    final number = num.tryParse(value!);


    return !(number == null);
  }
}