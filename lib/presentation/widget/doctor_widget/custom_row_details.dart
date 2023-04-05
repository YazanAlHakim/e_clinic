import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRowDetails extends StatelessWidget {

  final IconData icon;
  final String text;
  const CustomRowDetails({
    Key? key,
    required this.icon,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
           icon,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
