import 'package:flutter/material.dart';
import 'package:compound/src/ui/global/app_colors.dart';
import 'package:compound/src/ui/global/ui_helpers.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;
  final Color circularProgressColor;
  final bool isBusy;
  final double elevation;

  RoundedButton({
    @required this.text,
    @required this.onPressed,
    this.padding,
    @required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.textColor = textColorWhite,
    this.buttonColor = primaryColor,
    this.circularProgressColor = textColorWhite,
    this.isBusy = false,
    this.elevation,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: elevation ?? 3,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: blockSizeHorizontal(context) * 7,
            vertical: blockSizeHorizontal(context) * 4,
          ),
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: !isBusy
          ? Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                circularProgressColor,
              ),
            ),
      onPressed: onPressed,
    );
  }
}
