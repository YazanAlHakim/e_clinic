import 'package:flutter/material.dart';

class CustomRadioButtonBar extends StatelessWidget {

  final String value1;
  final String value2;
  final String groupValue;
  final void Function(String?) onChange;

    const CustomRadioButtonBar({
    Key? key,
    required this.value1,
    required this.value2,
    required this.groupValue, required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 24.0, end: 24.0),
      margin: const EdgeInsetsDirectional.only(bottom: 12.0),
      height: 42.0,
      decoration: BoxDecoration(
          color:  const Color(0xffE9F7EF),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Radio(
                  value: value1,
                  groupValue: groupValue,
                  onChanged: onChange
              ),
              Text(
                  value1,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: value2,
                  groupValue: groupValue,
                  onChanged: onChange
              ),
              Text(
                  value2
              ),
            ],
          ),
          // Visibility(
          //   visible: addOne,
          //   child: Row(
          //     children: [
          //       Radio(
          //           value: value3!,
          //           groupValue: groupValue,
          //           onChanged: onChange
          //       ),
          //       Text(
          //           value3!
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
