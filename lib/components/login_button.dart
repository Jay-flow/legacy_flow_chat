import 'package:flutter/material.dart';
import 'package:flow/utils/asset.dart' as Asset;

class LoginButton extends StatelessWidget {
  LoginButton({
    @required this.onPressed,
    @required this.label,
    @required this.icon,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
  });

  final Function onPressed;
  final String label;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 11),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 40.0),
            child: icon,
          ),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: BorderSide(
          color: Asset.Colors.white,
        ),
      ),
    );
  }
}
