import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomNameTimeOfPost extends StatelessWidget {

  final String name;
  final String time;

  const CustomNameTimeOfPost({
    Key? key,
    required this.name,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold

          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          time,
          style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp

          ),
        ),
      ],
    );
  }
}
