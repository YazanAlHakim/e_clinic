import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleOfDetails extends StatelessWidget {

  final String title;
  const TitleOfDetails({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'cairo',
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
