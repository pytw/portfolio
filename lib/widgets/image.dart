import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  svg,
  asset,
}

class WImage extends StatelessWidget {
  final String imagePath;
  final ImageType imageType;
  final BoxFit fit;

  const WImage({
    super.key,
    required this.imagePath,
    required this.imageType,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (imageType == ImageType.svg) {
      return SvgPicture.asset(
        imagePath,
        fit: fit,
        placeholderBuilder: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Image.asset(
        imagePath,
        fit: fit,
      );
    }
  }
}
