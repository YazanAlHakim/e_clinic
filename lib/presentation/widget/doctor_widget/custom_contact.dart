import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';

class CustomContact extends StatelessWidget {
  final String text;
  final String number;
  const CustomContact({
    Key? key,
    required this.text,
    required this.number
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColor.darkGreen,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,

            ),
          ),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
