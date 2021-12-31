import 'package:flutter/material.dart';


// Icon

class CustomCircularIconButton extends StatefulWidget {
  CustomCircularIconButton(this.btnHeight, this.btnWidth, this.btnColor,this.icon, this.iconColor, this.iconSize, this.fun);
  double btnHeight;
  double btnWidth;
  Color btnColor;
  Color iconColor;
  double iconSize;
  IconData icon;
  VoidCallback fun;

  @override
  State<CustomCircularIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomCircularIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        height: widget.btnHeight,
        width: widget.btnWidth,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnColor
        ),
        child: Center(
          child: Icon(widget.icon, color: widget.iconColor, size: widget.iconSize,),
        ),
      ),
    );
  }
}

// ------------------------------------------------------

class CustomRectangleIconButton extends StatefulWidget {
  CustomRectangleIconButton(this.btnHeight, this.btnWidth, this.btnColor,this.icon, this.iconColor,this.radius, this.iconSize, this.fun);
  double btnHeight;
  double btnWidth;
  Color btnColor;
  Color iconColor;
  double iconSize;
  double radius;
  IconData icon;
  VoidCallback fun;

  @override
  State<CustomRectangleIconButton> createState() => _CustomRectangleIconButtonState();
}

class _CustomRectangleIconButtonState extends State<CustomRectangleIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        height: widget.btnHeight,
        width: widget.btnWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnColor
        ),
        child: Center(
          child: Icon(widget.icon, color: widget.iconColor, size: widget.iconSize,),
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// Image

class CustomCircularImageButton extends StatefulWidget {
  CustomCircularImageButton(this.btnHeight, this.btnWidth, this.btnColor,this.dir, this.iconColor, this.iconSize, this.fun);
  double btnHeight;
  double btnWidth;
  Color btnColor;
  Color iconColor;
  double iconSize;
  var dir;
  VoidCallback? fun;

  @override
  State<CustomCircularImageButton> createState() => _CustomCircularImageButtonState();
}

class _CustomCircularImageButtonState extends State<CustomCircularImageButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        height: widget.btnHeight,
        width: widget.btnWidth,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnColor
        ),
        child: Center(
          child: ImageIcon(AssetImage(widget.dir), color: widget.iconColor, size: widget.iconSize,),
        ),
      ),
    );
  }
}

// ------------------------------------------------------

class CustomRectangleImageButton extends StatefulWidget {
  CustomRectangleImageButton(this.btnHeight, this.btnWidth, this.btnColor,this.dir, this.iconColor,this.radius, this.iconSize, this.fun);
  double btnHeight;
  double btnWidth;
  Color btnColor;
  Color iconColor;
  double iconSize;
  double radius;
  var dir;
  VoidCallback? fun;

  @override
  State<CustomRectangleImageButton> createState() => _CustomRectangleImageButtonState();
}

class _CustomRectangleImageButtonState extends State<CustomRectangleImageButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        height: widget.btnHeight,
        width: widget.btnWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnColor
        ),
        child: Center(
          child: ImageIcon(AssetImage(widget.dir), color: widget.iconColor, size: widget.iconSize,),
        ),
      ),
    );
  }
}