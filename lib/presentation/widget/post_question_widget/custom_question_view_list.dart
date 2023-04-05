import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';
import '../../../model/question_view_model.dart';
import '../global_widget/custom_doctor_image.dart';
import '../primary_screen_widget/custom_circular_image.dart';
import 'custom_text_of_question.dart';

class CustomQuestionViewList extends StatelessWidget {
  final List questions;
  const CustomQuestionViewList({Key? key, required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(start: 12.0,end: 12.0,top: 20.0),
      itemCount: questions.length,
      separatorBuilder: (context,index){
        return SizedBox(height:3.h);
      },
      itemBuilder: (context, index) {
        return QuestionView(
            questionViewModel: QuestionViewModel.fromJson(questions[index]));
      },
    );
  }
}

class QuestionView extends StatelessWidget {
  final QuestionViewModel questionViewModel;
  const QuestionView({Key? key, required this.questionViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return questionViewModel.repliesId != null
        ? Row(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColor.darkGreen),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomCircularImage(image: questionViewModel.image!),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    questionViewModel.anonymous == 1 ? 'مجهول' : questionViewModel.name!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                  ),
                                  const Text(
                                    'يسأل :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2,),
                              Text(
                                Jiffy(questionViewModel.repliesCreatedAt).format('yyyy/M/d , h:mm a'),
                                style: TextStyle(fontSize: 8.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextOfQuestion(
                        text: questionViewModel.body!,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 20.0, start: 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             CustomDoctorImage(
                              image: questionViewModel.doctorImage!,
                              height: 40.0,
                              width: 40.0,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'د. ${questionViewModel.doctorName}',
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.arrow_right,
                                    ),
                                    const Text(
                                      'يجيب :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  Jiffy(questionViewModel.createdAt).format('yyyy/M/d , h:mm a'),
                                  style: TextStyle(fontSize: 8.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                       CustomTextOfQuestion(
                        text: questionViewModel.repliesBody!,
                      ),
                    ],
                  ),
                ),
            ),
          ],
        )
        : Row(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColor.darkGreen),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomCircularImage(image: questionViewModel.image!),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    questionViewModel.anonymous == 1 ? 'مجهول' : questionViewModel.name!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                  ),
                                  const Text(
                                    'يسأل :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2,),
                              Text(
                                Jiffy(questionViewModel.createdAt).format('yyyy/M/d , h:mm a'),
                                style: TextStyle(fontSize: 8.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          questionViewModel.body!,
                          style: const TextStyle(
                            color: AppColor.darkGreen,
                            fontFamily: 'cairo',
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        );
  }
}

