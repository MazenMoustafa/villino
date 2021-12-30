import 'package:flutter/material.dart';

class CustomAssetsImage extends StatefulWidget {
  double height;
  double width;
  String dir;
  CustomAssetsImage(this.height, this.width, this.dir);



  @override
  _CustomAssetsImageState createState() => _CustomAssetsImageState(this.height, this.width, this.dir);
}

class _CustomAssetsImageState extends State<CustomAssetsImage> {

  double height;
  double width;
  String dir;
  _CustomAssetsImageState(this.height, this.width, this.dir);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(dir),
        ),
      ),
    );
  }
}
