import 'package:e_clinic/model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../../core/constant/color_app.dart';
import '../global_widget/custom_doctor_image.dart';
import 'custom_image_of_post.dart';
import 'custom_name_time_post.dart';
import 'custom_text_of_post.dart';

class CustomPostsView extends StatelessWidget {
  final List posts ;
  const CustomPostsView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(start: 12.0,end: 12.0,top: 20.0),
        itemCount: posts.length,
        separatorBuilder: (context,index){
          return SizedBox(height: 3.h,);
        },
        itemBuilder: (context,index){
          return Post(postViewModel: PostViewModel.fromJson(posts[index]),);
        },
      );
  }
}


class Post extends StatelessWidget {
  final PostViewModel postViewModel;

  const Post({Key? key, required this.postViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border:
        Border.all(width: 2, color: AppColor.darkGreen),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CustomImageOfPost(imagePost: postViewModel.image!),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10.0, start: 14.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          CustomDoctorImage(
                            image: postViewModel.doctor!.image!,
                            height: 40.0,
                            width: 40.0,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          CustomNameTimeOfPost(
                            //الدكتور
                            name: 'د. ${postViewModel.doctor!.name!}',
                            time: Jiffy(postViewModel.createdAt).format('yyyy/M/d , h:mm a'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                 CustomTextOfPost(
                  text: postViewModel.body!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




//image: new DecorationImage(
//                 fit: BoxFit.cover,
//                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
//                 image: new NetworkImage(
//                   'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
//                 ),

