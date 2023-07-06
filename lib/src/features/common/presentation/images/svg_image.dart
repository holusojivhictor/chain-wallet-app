import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    required this.image,
    super.key,
    this.width,
    this.height,
    this.fontSize = 14,
    this.color = const Color(0xFF000000),
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
  });

  final String image;
  final double? width;
  final double? height;
  final double fontSize;
  final BoxFit fit;
  final Color color;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      semanticsLabel: image.split('.').first,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
