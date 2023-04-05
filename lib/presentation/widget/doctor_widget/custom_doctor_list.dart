import 'package:e_clinic/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';
import '../../../core/constant/routes_app.dart';
import 'bar_of_doctor.dart';
import 'doctor_details.dart';

class CustomDoctorList extends StatelessWidget {
  final List doctors;
  const CustomDoctorList({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      separatorBuilder: (context , index){
        return SizedBox(height: 2.h,);
      },
      itemCount: doctors.length,
        itemBuilder: (context,index){
          return Doctor(
              doctorModel: DoctorModel.fromJson(doctors[index]),
              i: index,
          );
        }
    );
  }
}

class Doctor extends StatelessWidget {
  final DoctorModel doctorModel;
  final int i ;
  const Doctor({Key? key, required this.doctorModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, AppRoutes.doctorDetails,
        arguments: {
            'doctorData' : doctorModel,
        }
        );
      },
      child: Container(
        height: 176.0,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.lightGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            DoctorDetails(
              name: doctorModel.name!,
              image: doctorModel.image!,
              specialization: doctorModel.specialization!.name!,
              city: doctorModel.city!.name!,
              address: doctorModel.fullAddress!,
              lat: doctorModel.lat!,
              lon: doctorModel.lon!,
              flag: true,
              color: Colors.white,
            ),
            BarOfDoctor(
              rate: doctorModel.rate!,
              posts: doctorModel.numPost!,
              consulting: doctorModel.numConsulting!,
              height: 50.0,
              paddingHorizontal: 36.0,
              color: Colors.white,
              textColor: AppColor.darkGreen,
            ),
          ],
        ),
      ),
    );
  }
}








// padding: const EdgeInsets.symmetric(horizontal: 10.0),