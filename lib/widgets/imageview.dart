import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageViewNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  const ImageViewNetwork(
      {this.fit = BoxFit.cover,
      required this.url,
      this.width,
      this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: theme.cardColor,
          highlightColor: theme.backgroundColor,
          child: Container(
            color: Colors.grey.withOpacity(0.4),
            width: width,
            height: height,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Image.asset('assets/images/image_error_square.png',
            width: width, height: height, fit: fit);
      },
    );
  }
}
