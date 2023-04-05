import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:jiffy/jiffy.dart';
import '../../../core/constant/color_app.dart';
import '../../../model/waiting_consultation_model.dart';

class CustomWaitingConsultationList extends StatelessWidget {
  final List waitingConsultation;
  const CustomWaitingConsultationList({Key? key, required this.waitingConsultation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0,top: 20.0),
      separatorBuilder: (context,index){
        return SizedBox(height: 2.h,);
      },
      itemCount: waitingConsultation.length,
      itemBuilder: (context, index){
        return  WaitingConsultation(waitingConsultationModel: WaitingConsultationModel.fromJson(waitingConsultation[index]),);
      },
    );
  }
}

class WaitingConsultation extends StatelessWidget {
  final WaitingConsultationModel waitingConsultationModel;
  const WaitingConsultation({Key? key,required this.waitingConsultationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      height: 130.0,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColor.darkGreen),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: AppColor.lightGreen,
                      borderRadius:
                      BorderRadius.circular(8.0)),
                  child: const FittedBox(
                    child: Icon(
                      Icons.person_outline,
                      color: AppColor.darkGreen,
                      size: 34.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0),
                child: Text(
                  'في انتظار اجابة الطبيب',
                  style: TextStyle(
                      color: AppColor.darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
              ),
              const Spacer(),
              Text(
                Jiffy(waitingConsultationModel.createdAt).yMd,
              ),
            ],
          ),
          Text(
           waitingConsultationModel.title!,
            style: TextStyle(
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColor.darkGreen),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

