import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';
import '../../../core/constant/image_app.dart';
import '../../../core/constant/routes_app.dart';
import '../../../model/medication_model.dart';

class CustomMedicationList extends StatelessWidget {
  final List medications;
  const CustomMedicationList({Key? key, required this.medications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
         separatorBuilder: (context,index){
           return SizedBox(height: 2.h,);
         },
           itemCount: medications.length,
          itemBuilder: (context, index) {
            return Medication(
              medicationModel: MedicationModel.fromJson(medications[index]),
        );
      }
      ),
    );
  }
}

class Medication extends StatelessWidget {
  final MedicationModel medicationModel;
  const Medication({Key? key, required this.medicationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context,
            AppRoutes.medicationDetails,
          arguments: {
              'name' :medicationModel.name,
              'dose' : medicationModel.dose,
              'duration' : medicationModel.duration,
              'note' : medicationModel.notes,
              'doctorName' : medicationModel.doctor!.name,
              'title' : medicationModel.consultation!.title,
          }
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [AppColor.darkGreen, AppColor.lightGreen]),
        ),
        child: Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: 20.sp,
            ),
            const SizedBox(
              width: 18.0,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicationModel.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Text(
                      medicationModel.dose!,
                      style: TextStyle(
                        color: Colors.white60,
                        fontFamily: 'cairo',
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    AppImage.medical,
                    height: 78.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                  FittedBox(
                    child: Text(
                      Jiffy(medicationModel.duration!).format('yyyy/M/d'),
                      style: const TextStyle(fontFamily: 'cairo'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
