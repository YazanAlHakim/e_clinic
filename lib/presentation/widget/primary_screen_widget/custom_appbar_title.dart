import 'package:e_clinic/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppbarTitle extends StatelessWidget {
  const CustomAppbarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(
      'اهلا بعودتك ${prefs.getString('name')}',
      style: TextStyle(
          fontFamily: 'cairo',
          fontSize: 13.sp,
      ),

    );
  }
}
