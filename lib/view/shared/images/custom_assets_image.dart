import 'package:flutter/material.dart';
import 'package:vallino/util/color_resources.dart';

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


class CustomBorderedAssetsImage extends StatefulWidget {
  double btnWidth;
  double btnHeight;
  String dir;
   CustomBorderedAssetsImage({Key? key,required this.btnWidth,required this.btnHeight,required this.dir}) : super(key: key);

  @override
  _CustomBorderedAssetsImageState createState() => _CustomBorderedAssetsImageState();
}

class _CustomBorderedAssetsImageState extends State<CustomBorderedAssetsImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.btnHeight,
      width: widget.btnWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(color: ColorResources.BLACK, width: 0.5)
      ),
      child: Center(
        child: Image.asset(widget.dir)
      ),
    );

  }
}
