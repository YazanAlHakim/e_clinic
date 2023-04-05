import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/image_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/costum_loading.dart';
import 'package:e_clinic/presentation/widget/post_question_widget/custom_text_of_post.dart';
import 'package:e_clinic/presentation/widget/primary_screen_widget/custom_circular_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../main.dart';
import '../widget/post_question_widget/custom_change_category.dart';
import '../widget/post_question_widget/custom_image_of_post.dart';
import '../widget/post_question_widget/custom_name_time_post.dart';
import '../widget/post_question_widget/custom_post_view.dart';
import '../widget/post_question_widget/custom_question_view_list.dart';
import '../widget/post_question_widget/custom_text_of_question.dart';

class PostQuestionScreen extends StatelessWidget {
  const PostQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PostQuestionBloc, PostQuestionState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top : 4.0),
                child: Row(
                  children: [
                    CustomCircularImage(image: prefs.getString('image')!),
                    const SizedBox(width: 6.0,),
                    Text(
                      'اهلا بعودتك ${prefs.getString('name')}',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              //toggle between category
              CustomChangeCategory(
                category: BlocProvider.of<PostQuestionBloc>(context).selectedCategory,
                color: AppColor.darkGreen,
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(16.0),
                        topStart: Radius.circular(16.0)),
                  ),
                  child: BlocBuilder<PostQuestionBloc, PostQuestionState>(
                    builder: (context, state) {
                      if (state is PostQuestionLoadingState) {
                        return Center(
                            child: Lottie.asset(
                          AppImage.loading,
                          height: 150.sp,
                          width: 200.sp,
                        ));
                      } else if (state is GetPostDoneState) {
                        return CustomPostsView(
                          posts: state.posts,
                        );
                      } else if (state is GetQuestionDoneState) {
                        return CustomQuestionViewList(
                          questions: state.questions,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
