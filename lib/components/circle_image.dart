import 'package:flutter/material.dart';
import 'package:flow_chat/utils/constants.dart';

class CircleImage extends StatelessWidget {
  final String imagePath;
  final double size;

  CircleImage({
    @required this.imagePath,
    this.size = 140,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: kLoadingImagePath,
        image: imagePath,
      ),
    );
  }
}
