import 'package:flutter/material.dart';

class CustomGridRadioButton extends StatelessWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String groupValue;
  final void Function(String?) onChange;

  const CustomGridRadioButton({
    Key? key,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.groupValue,
    required this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
          color:  const Color(0xffE9F7EF),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: GridView(
        padding: const EdgeInsetsDirectional.only(start: 40.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 40,
            crossAxisSpacing: 50
        ),
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
          Row(
            children: [
              Radio(
                  value: value3,
                  groupValue: groupValue,
                  onChanged: onChange
              ),
              Text(
                  value3
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: value4,
                  groupValue: groupValue,
                  onChanged: onChange
              ),
              Text(
                  value4
              ),
            ],
          ),
        ],
      ),
    );
  }
}
