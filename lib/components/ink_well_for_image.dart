import 'package:flutter/material.dart';

//InkWell 이미지의 경우 터치할때 Splash Color 가 안보이는 버그가 있어서 만든 위젯
//https://stackoverflow.com/questions/48066321/inkwell-ripple-over-top-of-image-in-gridtile-in-flutter
class InkWellForImage extends StatelessWidget {
  InkWellForImage({
    @required this.child,
    @required this.onTap,
  });

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              focusColor: Colors.white,
              hoverColor: Colors.white,
              highlightColor: Colors.black.withOpacity(0.2),
              splashColor: Colors.white.withOpacity(0.2),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
