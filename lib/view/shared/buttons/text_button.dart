
import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';

class LongCustomSimpleTextButton extends StatelessWidget {
  String txt;
  dynamic fun;

  LongCustomSimpleTextButton( this.txt,  this.fun);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(50),
      width: SizeConfig.screenWidth * 0.8,
      child: TextButton(
          onPressed: fun,
          child: Center(child: Text(txt, style: TextStyle(color: ColorResources.WHITE,fontSize: 16, height: 1), )),
          style: TextButton.styleFrom(
              backgroundColor: ColorResources.PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsiveSize(5))
              )

          )
      ),
    );
  }
}

class MediumCustomSimpleTextButton extends StatelessWidget {
  String txt;
  dynamic fun;

  MediumCustomSimpleTextButton( this.txt,  this.fun);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(50),
      width: SizeConfig.screenWidth * 0.4,
      child: TextButton(
          onPressed: fun,
          child: Center(child: Text(txt, style: TextStyle(color: ColorResources.WHITE,fontSize: 16, height: 1), )),
          style: TextButton.styleFrom(
              backgroundColor: ColorResources.PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsiveSize(10))
              )

          )
      ),
    );
  }
}

class ShortCustomSimpleTextButton extends StatelessWidget {
  String txt;
  dynamic fun;

  ShortCustomSimpleTextButton( this.txt,  this.fun);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(35),
      width: SizeConfig.screenWidth * 0.2,
      child: TextButton(
          onPressed: fun,
          child: Center(child: Text(txt, style: TextStyle(color: ColorResources.WHITE,fontSize: responsiveSize(14), height: 1), )),
          style: TextButton.styleFrom(
              backgroundColor: ColorResources.PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsiveSize(5))
              )

          )
      ),
    );
  }
}

class CustomComplexTextButton extends StatelessWidget {
  double height;
  double width;
  double radius;
  String txt;
  double fontSize;
  Color textColor;
  Color buttonColor;
  dynamic fun;

  CustomComplexTextButton(this.height, this.width, this.radius, this.txt, this.textColor, this.buttonColor, this.fontSize, this.fun);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height, // with a font size more than 16 this height can't be less than 50 with text height 2
        child: TextButton(
            onPressed: fun,
            child: Center(child: Text(txt, style: TextStyle(color: textColor, fontSize: fontSize, height: 1), )),
            style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius)
                )

            )
        )
    );
  }
}