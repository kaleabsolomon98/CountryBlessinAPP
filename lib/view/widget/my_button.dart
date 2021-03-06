import 'package:countyourblessings/view/constant/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text, weight,textColor,btnBgColor,radius;
  double? textSize, height,elevation;
  VoidCallback? onPressed;

  MyButton({Key? key,
    this.text,
    this.textSize = 16,
    this.textColor = kPrimaryColor,
    this.btnBgColor = kSecondaryColor,
    this.height = 72,
    this.elevation = 0,
    this.radius = 11.0,
    this.weight = FontWeight.bold,
    this.onPressed,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: kPrimaryColor.withOpacity(0.1),
      highlightColor: kPrimaryColor.withOpacity(0.1),
      elevation: widget.elevation,
      highlightElevation: widget.elevation,
      onPressed: widget.onPressed,
      color: widget.btnBgColor,
      height: widget.height,
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
      child: Text(
        '${widget.text}',
        style: TextStyle(
          fontSize: widget.textSize,
          color: widget.textColor,
          fontWeight: widget.weight,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
