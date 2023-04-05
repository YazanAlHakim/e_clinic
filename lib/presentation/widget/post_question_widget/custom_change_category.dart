import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../../core/constant/color_app.dart';

class CustomChangeCategory extends StatelessWidget {

  final bool category;
  final Color color;

  const CustomChangeCategory({
    Key? key,
    required this.category, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 17.0,top: 21.0,start: 4.0,end: 4.0),

      height: 48.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround
        ,
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<PostQuestionBloc>(context).add(const ChangeCategoryEvent(true));
              BlocProvider.of<PostQuestionBloc>(context).add(GetPostsEvent());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
              decoration: category ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0))
                  : null,
              child: Text(
                'المنشورات',
                style: TextStyle(
                  color: category
                      ? AppColor.darkGreen
                      : Colors.white,
                  fontWeight:
                  category ? FontWeight.bold : null,
                  fontSize: 13.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<PostQuestionBloc>(context).add(const ChangeCategoryEvent(false));
              BlocProvider.of<PostQuestionBloc>(context).add(GetQuestionEvent());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 2.0, horizontal: 50.0),
              decoration: category == false
                  ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0))
                  : null,
              child: Text(
                'الاسئلة',
                style: TextStyle(
                  color: category == false
                      ? AppColor.darkGreen
                      : Colors.white,
                  fontWeight: category == false
                      ? FontWeight.bold
                      : null,
                  fontSize: 13.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
