import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';

ThemeData light = ThemeData(
  fontFamily: 'TitilliumWeb',
  primaryColor: ColorResources.PRIMARY_COLOR,
  brightness: Brightness.light,
  accentColor: ColorResources.PRIMARY_COLOR,
  hintColor: ColorResources.PRIMARY_COLOR,
  secondaryHeaderColor: ColorResources.PRIMARY_COLOR,

  // pageTransitionsTheme: PageTransitionsTheme(builders: {
  //   TargetPlatform.android: ZoomPageTransitionsBuilder(),
  //   TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
  //   TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  // }),

);