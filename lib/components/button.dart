import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    @required this.onPressed,
    @required this.buttonText,
    this.fontWeight = FontWeight.normal,
    this.buttonColor = asset.Colors.skyBlue,
    this.textColor = asset.Colors.white,
  });

  final FontWeight fontWeight;
  final Color buttonColor;
  final Color textColor;
  final Function onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      splashColor: Theme.of(context).accentColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
