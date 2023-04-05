import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';

class CustomToggleWidget extends StatelessWidget {

  final bool active;
  final bool withIcon;
  final String text1;
  final String text2;
  final  void Function() onClickYes;
  final  void Function() onClickNo;

  const CustomToggleWidget({
    Key? key,
    required this.withIcon,
    required this.text1,
    required this.text2,
    required this.onClickYes,
    required this.active,
    required this.onClickNo,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 24.0, end: 24.0),
      margin: const EdgeInsetsDirectional.only(bottom: 20.0,top: 16.0),
      height: 42.0,
      decoration: BoxDecoration(
          color:  const Color(0xffE9F7EF),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onClickYes,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 42.0),
              decoration: active
                  ? BoxDecoration(
                  color: AppColor.lightGreen,
                  borderRadius: BorderRadius.circular(14.0))
                  : null,
              child: Row(
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.sp,
                      fontFamily: 'cairo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Visibility(
                    visible: withIcon,
                    child: Icon(
                      Iconsax.man,
                      color: active ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onClickNo,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 42.0),
              decoration: active
                  ? null
                  : BoxDecoration(
                  color: AppColor.lightGreen,
                  borderRadius: BorderRadius.circular(14.0)
              ),
              child: Row(
                children: [
                  Text(
                    text2,
                    style: TextStyle(
                      color:
                      active ? Colors.black :  Colors.white,
                      fontWeight:  FontWeight.bold ,
                      fontSize: 9.sp,
                      fontFamily: 'cairo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Visibility(
                    visible: withIcon,
                    child:  Icon(
                      Iconsax.woman,
                      color: active ?  Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
