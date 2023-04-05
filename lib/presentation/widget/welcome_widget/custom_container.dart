import 'package:e_clinic/core/constant/color_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/image_app.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 58.h,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: AppColor.lightGreen,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(200.0)),
        ),
        child: Lottie.asset(
          AppImage.doctorLottie,
        ),
      ),
    );
  }
}
