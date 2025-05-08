import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/color_manager.dart';
class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,

      placeholder: (context, url) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: ColorManager.chatContainerColor,
        child: const CircularProgressIndicator(
          color: ColorManager.primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: ColorManager.chatContainerColor,
        child: const Icon(Icons.broken_image, color: ColorManager.errorColor),
      ),
    );
  }
}
