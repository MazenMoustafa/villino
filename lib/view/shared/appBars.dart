import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/buttons/icon_button.dart';

class AppBars{
  static PreferredSizeWidget registrationAppBar(String title, Color titleColor, Color bgColor) {
    return AppBar(
      title: Text(title, style: TextStyle(color: titleColor,fontSize: 30),),
      centerTitle: true,
      backgroundColor: bgColor,
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
    );
  }

  static PreferredSizeWidget homeAppBar(BuildContext context){
    return AppBar(
      backgroundColor: ColorResources.WHITE,
      title: Text("الرئيسية", style: TextStyle(color: ColorResources.BLACK, fontWeight: FontWeight.bold),),
      centerTitle: true,
      actions: [
        CustomCircularImageButton(
            responsiveHeight(25),
            responsiveWidth(25),
            ColorResources.WHITE,
            "assets/image/ic_notification.png",
            ColorResources.BLACK,
            responsiveSize(20),
            null
        ),
        CustomCircularImageButton(
            responsiveHeight(25),
            responsiveWidth(25),
            ColorResources.WHITE,
            "assets/image/ic_list.png",
            ColorResources.BLACK,
            responsiveSize(20),
            null
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(responsiveHeight(50)),
        child: Center(
          child: Container(
            height: responsiveHeight(50),
            width: SizeConfig.screenWidth*0.9,
            padding: EdgeInsets.only(bottom: 10),
            child: Theme(
              data: Theme.of(context).copyWith( colorScheme: ThemeData().colorScheme.copyWith(primary: ColorResources.HINT_TEXT_COLOR) ),
              child: TextField(
                cursorColor: ColorResources.HINT_TEXT_COLOR,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(5), horizontal: responsiveWidth(5)), // The Content PAdding gets changed when an error appears
                  isDense: true,
                  hintText: "بحث",
                  labelStyle: TextStyle(color: ColorResources.HINT_TEXT_COLOR, height: 0.75),
                  fillColor: ColorResources.TF_FILL_COLOR,
                  filled: true,
                  prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 30),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}