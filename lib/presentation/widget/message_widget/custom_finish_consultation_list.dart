import 'package:e_clinic/model/finish_consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';
import '../../../core/constant/routes_app.dart';
import '../../../main.dart';
import '../global_widget/custom_doctor_image.dart';

class CustomFinishConsultationList extends StatelessWidget {
  final List finishConsultation;
  const CustomFinishConsultationList({Key? key, required this.finishConsultation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0,top: 20.0),
        itemBuilder: (context,index){
          return FinishConsultation(finishConsultationModel: FinishConsultationModel.fromJson(finishConsultation[index]),);
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 2.h,);
        },
        itemCount: finishConsultation.length
    );
  }
}


class FinishConsultation extends StatelessWidget {
  final FinishConsultationModel finishConsultationModel;
  const FinishConsultation({Key? key, required this.finishConsultationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, AppRoutes.finishedConsultation,
        arguments: {
              'title' : finishConsultationModel.title,
              'details' : finishConsultationModel.notes,
              'flag' : finishConsultationModel.medications,
              'doctorName' : finishConsultationModel.doctor!.name,
              'doctorId' : finishConsultationModel.doctorId,
        }
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14.0),
        height: 152.0,
        decoration: BoxDecoration(
            border:
            Border.all(width: 1, color: AppColor.darkGreen),
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'نتمنى لك الشفاء العاجل',
              style: TextStyle(
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: Colors.redAccent),
            ),
            Row(
              children: [
                CustomDoctorImage(
                  image:finishConsultationModel.doctor!.image!,
                  height: 40.0,
                  width: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0),
                  child: Text(
                      'د. ${finishConsultationModel.doctor!.name!}',
                    style: TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
                const Spacer(),
                Text(
                   Jiffy(finishConsultationModel.createdAt).yMd,
                ),
              ],
            ),
            Text(
              finishConsultationModel.title!,
              style: TextStyle(
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColor.darkGreen),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

