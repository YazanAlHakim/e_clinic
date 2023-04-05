import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final  void Function() onTab;

  const CustomButton({Key? key, required this.text, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 7.h),
      child: MaterialButton(
        onPressed:onTab,
        color: AppColor.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        minWidth: 26.w,
        child:  Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'cairo'
          ),
        ),
      ),
    );
  }
}
