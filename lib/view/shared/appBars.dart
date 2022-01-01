import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';

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
}