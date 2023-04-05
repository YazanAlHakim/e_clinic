import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';

class CustomSubTitleAuth extends StatelessWidget {
  final String title;

  const CustomSubTitleAuth({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
       title,
        style: TextStyle(
            color: AppColor.darkGreen,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo'
        ),
      ),
    );
  }
}
