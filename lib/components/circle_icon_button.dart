import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  CircleIconButton({
    this.iconColor = Colors.grey,
    this.iconSize = 30.0,
    this.onPressed,
    @required this.icon,
  });

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    );
  }
}
