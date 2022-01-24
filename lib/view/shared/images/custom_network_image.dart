import 'package:flutter/material.dart';

class CustomNetworkImage extends StatefulWidget {
  double height;
  double width;
  String dir;
  CustomNetworkImage(this.height, this.width, this.dir);
  
  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState(this.height, this.width, this.dir);
}


class _CustomNetworkImageState extends State<CustomNetworkImage> {

  double height;
  double width;
  String dir;
  _CustomNetworkImageState(this.height, this.width, this.dir);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(dir),
        ),
      ),
    );
  }
}