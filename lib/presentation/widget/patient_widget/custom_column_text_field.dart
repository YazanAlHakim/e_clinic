import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';

class CustomColumnTextField extends StatelessWidget {

  final String title;
  final TextInputType keyboardType;
  final TextEditingController textFieldController;
  const CustomColumnTextField({Key? key, required this.title, required this.keyboardType, required this.textFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
           style: TextStyle(
              color: AppColor.darkGreen,
              fontSize: 9.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'cairo'),
        ),
        Container(
          width: 70.0,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 14.0),
            child: TextFormField(
              controller: textFieldController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.white
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      width: 0.0,
                      color: Colors.white
                  ),
                ),
                border: InputBorder.none,
                fillColor: const Color(0xffE9F7EF),
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 8.0),
              ),
              keyboardType: keyboardType,
            ),
          ),
        ),
      ],
    );
  }
}
