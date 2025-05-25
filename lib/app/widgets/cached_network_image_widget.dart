import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/color_manager.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double clipRadius;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200,
    this.fit = BoxFit.cover,
    this.clipRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(clipRadius),
      child: CachedNetworkImage(
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
      ),
    );
  }
}
