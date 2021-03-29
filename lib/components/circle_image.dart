import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flutter/material.dart';

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
        placeholder: Asset.Images.loadingImage,
        image: imagePath,
      ),
    );
  }
}
