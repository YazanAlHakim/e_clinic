import 'package:flutter/material.dart';
import '../../../core/constant/image_app.dart';

class CustomCircularImage extends StatelessWidget {
  final String image;
  const CustomCircularImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: CircleAvatar(
        radius: 22.0,
        backgroundImage: NetworkImage(
         image,
        ),
      ),
    );
  }
}
