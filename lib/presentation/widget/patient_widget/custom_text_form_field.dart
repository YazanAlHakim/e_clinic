import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatelessWidget {
  String? hint;
  bool? flag ;
  final TextInputType keyboardType;
  final TextEditingController textFieldController;
  CustomFormField({
    Key? key,
    this.hint,
    this.flag,
    required this.keyboardType,
    required this.textFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: flag! ? 10.0 : 0.0, bottom: flag! ? 8.0 : 12.0),
      child: TextFormField(
        controller: textFieldController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12.sp,
          ),
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
          contentPadding:  EdgeInsets.symmetric(
              vertical: flag! ? 10.0 : 5.0, horizontal: 11.0 ),
        ),
      ),
    );
  }
}
