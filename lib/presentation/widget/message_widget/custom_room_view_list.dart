import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/model/room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';
import '../global_widget/custom_doctor_image.dart';

class CustomRoomViewList extends StatelessWidget {
  final List roomView;
  const CustomRoomViewList({Key? key, required this.roomView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0,top: 20.0),
        itemBuilder: (context, index){
          return RoomView(
            roomViewModel: RoomViewModel.fromJson(roomView[index]),
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 2.h,);
        },
        itemCount: roomView.length
    );
  }
}


class RoomView extends StatelessWidget {
  final RoomViewModel roomViewModel;
  const RoomView({Key? key, required this.roomViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(
            context, AppRoutes.messageRoomScreen,
        arguments: {
              'roomId' : roomViewModel.id,
              'doctor' : roomViewModel.doctor,
        }
        );
      },
      child: Container(
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
                CustomDoctorImage(
                  image: roomViewModel.doctor!.image!,
                  height: 40.0,
                  width: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0),
                  child: Text(
                    'د. ${roomViewModel.doctor!.name!}',
                    style: TextStyle(
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
                const Spacer(),
                Text(
                  Jiffy(roomViewModel.createdAt).yMd,
                ),
              ],
            ),
            Text(
             roomViewModel.consultation!.title!,
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

