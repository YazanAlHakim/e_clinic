import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomImageOfPost extends StatelessWidget {
  final String imagePost;
  const CustomImageOfPost({Key? key, required this.imagePost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        height: 170.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagePost),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
