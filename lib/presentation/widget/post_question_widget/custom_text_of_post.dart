import 'package:flutter/material.dart';

import '../../../core/constant/color_app.dart';

class CustomTextOfPost extends StatelessWidget {

  final String text;

  const CustomTextOfPost({
        Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColor.darkGreen,
        fontFamily: 'cairo',
        fontSize: 13.0,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,

    );
  }
}
