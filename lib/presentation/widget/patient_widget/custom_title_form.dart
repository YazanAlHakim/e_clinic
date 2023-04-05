import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';

class CustomTitleForm extends StatelessWidget {

  final String title;
  const CustomTitleForm({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColor.darkGreen,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'cairo'),
    );
  }
}
