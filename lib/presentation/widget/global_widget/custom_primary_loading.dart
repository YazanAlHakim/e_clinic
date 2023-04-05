import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/image_app.dart';

class CustomPrimaryLoading extends StatelessWidget {
  const CustomPrimaryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
          AppImage.loading,
          height: 150.sp,
          width: 200.sp,
        )
    );
  }
}
