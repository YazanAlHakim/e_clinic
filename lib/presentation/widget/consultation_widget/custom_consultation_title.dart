import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';

class CustomConsultationTitle extends StatelessWidget {

  final String title;
  const CustomConsultationTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColor.darkGreen,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo'
            ),
          ),
        ],
      ),
    );
  }
}
