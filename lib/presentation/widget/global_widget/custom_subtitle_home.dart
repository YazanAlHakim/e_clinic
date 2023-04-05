import 'package:e_clinic/core/constant/color_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSubtitle extends StatelessWidget {

  final String? title ;
  final Color color;


  const CustomSubtitle(
      { Key? key,
        required this.title,
        required this.color,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: Text(
        title!,
        style: TextStyle(
            color: color,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'cairo'
        ),
      ),
    );
  }
}
