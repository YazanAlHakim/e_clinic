import 'package:flutter/material.dart';

import '../../../core/constant/color_app.dart';

class CustomDivider extends StatelessWidget {

  final double paddingTop;
  final double paddingBottom;
  const CustomDivider({
    Key? key,
    required this.paddingTop,
    required this.paddingBottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsetsDirectional.only(top: paddingTop,bottom: paddingBottom),
      child: const Divider(
        height: 2,
        thickness: 1.0,
        color: AppColor.darkGreen,
      ),
    );
  }
}
