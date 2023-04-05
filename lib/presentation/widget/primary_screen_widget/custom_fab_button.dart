import 'package:e_clinic/bloc/primary_home_bloc/primary_home_bloc.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../../core/constant/color_app.dart';

class CustomFabButton extends StatelessWidget {

  final String title;
  final void Function()? onTab;

  const CustomFabButton({
    Key? key,
    required this.title,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black87,
                        offset: Offset(6, 3),
                        spreadRadius: -4,
                        blurRadius: 4.0),
                  ]),
              child: MaterialButton(
                onPressed: onTab,
                color: AppColor.darkGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                      fontSize: 10.sp),
                ),
              ),
            );

          }

}
