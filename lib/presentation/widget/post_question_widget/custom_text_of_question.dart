import 'package:flutter/material.dart';

import '../../../core/constant/color_app.dart';

class CustomTextOfQuestion extends StatelessWidget {

  final String text;

  const CustomTextOfQuestion({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.darkGreen,
          fontFamily: 'cairo',
          fontSize: 14.0,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,

      ),
    );
  }
}
