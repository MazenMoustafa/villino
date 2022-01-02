import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showToast(BuildContext context, String msg){
  return Flushbar(
    message: msg,
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.blue[300],
    ),
    duration: Duration(seconds: 2),
    leftBarIndicatorColor: Colors.blue[300],
  )..show(context);
}