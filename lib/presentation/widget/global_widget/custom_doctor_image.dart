import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomDoctorImage extends StatelessWidget {

  final double? height;
  final double? width;
  final String image;

  const CustomDoctorImage({
    Key? key,
    required this.height,
    required this.width,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
       child: CachedNetworkImage(
         imageUrl: image,
         errorWidget: (context, url, error) => const Icon(Icons.error),
         height: height,
         width: width,
       ),
    );
  }
}
