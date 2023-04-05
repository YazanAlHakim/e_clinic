import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_clinic/bloc/primary_home_bloc/primary_home_bloc.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_subtitle_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/finished_consultation_bloc/finished_consultation_bloc.dart';
import '../../core/constant/image_app.dart';

class FinishedConsultationScreen extends StatelessWidget {
  const FinishedConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<FinishedConsultationBloc, FinishedConsultationState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:
              BlocBuilder<FinishedConsultationBloc, FinishedConsultationState>(
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      alignment: AlignmentDirectional.center,
                      contentPadding: const EdgeInsetsDirectional.only(
                          top: 20.0, start: 42.0, end: 42.0, bottom: 10.0),
                      title: const Text(
                        "قم بتقييم الطبيب ",
                        style: TextStyle(fontFamily: 'cairo'),
                      ),
                      content: RatingBar.builder(
                        initialRating: 3,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return const Icon(
                                Icons.sentiment_very_dissatisfied,
                                color: Colors.red,
                              );
                            case 1:
                              return const Icon(
                                Icons.sentiment_dissatisfied,
                                color: Colors.redAccent,
                              );
                            case 2:
                              return const Icon(
                                Icons.sentiment_neutral,
                                color: Colors.amber,
                              );
                            case 3:
                              return const Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.lightGreen,
                              );
                            case 4:
                              return const Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.green,
                              );
                            default:
                              return const Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.lightGreen,
                              );
                          }
                        },
                        onRatingUpdate: (rating) {
                          BlocProvider.of<FinishedConsultationBloc>(context)
                              .rating = rating.toString();
                        },
                      ),
                      actions: <Widget>[
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: TextButton(
                            onPressed: () {
                              print(BlocProvider.of<FinishedConsultationBloc>(
                                      context)
                                  .rating!);
                              BlocProvider.of<FinishedConsultationBloc>(context)
                                  .add(SendRatingEvent(
                                arguments['doctorId'],
                                BlocProvider.of<FinishedConsultationBloc>(
                                        context)
                                    .rating!,
                              ));
                            },
                            child: Container(
                              color: AppColor.lightGreen,
                              padding: const EdgeInsets.all(14),
                              child: const Text(
                                "تأكيد",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.star,
                ),
              );
            },
          ),
          body: Column(
            children: [
              Container(
                height: 336.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColor.lightGreen,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(34.0))),
                child: Column(
                  children: [
                    Lottie.asset(AppImage.doctorsLottie, height: 300.0),
                    Text(
                      'نتمنى لك الشفاء العاجل',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo',
                          fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(14.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        ' اجاب الدكتور ${arguments['doctorName']} على استشارتك ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const CustomSubtitle(
                      title: 'عنوان الشكوى',
                      color: Colors.redAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        arguments['title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const CustomSubtitle(
                      title: 'ملاحظات الطبيب',
                      color: Colors.redAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        arguments['details'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const CustomSubtitle(
                      title: 'الدواء',
                      color: Colors.redAccent,
                    ),
                    arguments['flag']
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'يوجد ادوية موصوفة اذهب لنافذة',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<PrimaryHomeBloc>(context)
                                        .add(const ChangePageEvent(2));
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.primaryScreen);
                                  },
                                  child: Text(
                                    ' أدويتي',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'لا تحتاج الى دواء, يرجى اتباع ملاحظات الطبيب فقط.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is SendRateDoneState) {
          AnimatedSnackBar.material(
            'تم ارسال تقييمك بنجاح',
            type: AnimatedSnackBarType.success,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: const Duration(seconds: 5),
          ).show(context);
          Navigator.pop(context);
        }
      },
    );
  }
}
