import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';

class GuetFormScreen extends StatefulWidget {
  const GuetFormScreen({Key? key}) : super(key: key);

  @override
  _GuetFormScreenState createState() => _GuetFormScreenState();
}

class _GuetFormScreenState extends State<GuetFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

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
