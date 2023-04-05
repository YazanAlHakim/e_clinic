import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';

class CustomItemInContainer extends StatelessWidget {
  final String title;
  final String type;
  final String int;
  const CustomItemInContainer({
    Key? key,
    required this.type,
    required this.int,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 2.0, horizontal: 12.0),
      decoration: type == int ? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
      ) : null,
      child: Text(
        title,
        style: TextStyle(
            color: type == int ? AppColor.darkGreen : Colors
                .white,
            fontWeight: type == int ? FontWeight.bold : null,
            fontSize: 13.sp


        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
