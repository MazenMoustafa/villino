import 'package:flutter/material.dart';

class CustomCircularUnborderImage extends StatelessWidget {

  double height;
  double width;
  String dir;


  CustomCircularUnborderImage(this.height, this.width,  this.dir);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xff7c94b6),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(dir),
          fit: BoxFit.cover,

        ),
        //borderRadius: BorderRadius.all( Radius.circular(50.0) ),
      ),
    );
  }
}