import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';

class CustomBottomBar extends StatelessWidget {

  final void Function()? onTab;
  final IconData icon;
  final bool active;

  const CustomBottomBar({
        Key? key,
       required this.onTab,
        required this.icon,
        required this.active,
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 46.0,
        padding: const EdgeInsetsDirectional.only(bottom: 10.0),
        decoration: BoxDecoration(
            border: active ?  const BorderDirectional(
              bottom: BorderSide(
                color: AppColor.lightGreen,
                width: 7.0,
              ),
            )
                : null
        ),
        child: Icon(
          icon,
          size: 18.sp,
        ),
      ),
    );
  }
}
