import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global_widget/custom_doctor_image.dart';

class DoctorDetails extends StatelessWidget {

  final bool flag;
  final Color color;
  final String name;
  final String specialization;
  final String image;
  final String city;
  final String address;
  final double lon;
  final double lat;
  const DoctorDetails({
    Key? key,
    required this.flag,
    required this.color,
    required this.name,
    required this.specialization,
    required this.image,
    required this.city,
    required this.address,
    required this.lon,
    required this.lat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
           Flexible(
            child: CustomDoctorImage(
              image: image,
              height: 82.0,
              width: 82.0,
            )
        ),
        const SizedBox(width: 10.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyle(
                color: color,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                //fontFamily: 'cairo',
              ),
            ),
            Visibility(
              visible: flag,
              child: Text(
                'اختصاص : $specialization',
                style: TextStyle(
                  color: color.withOpacity(0.8),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(
                    context,
                    AppRoutes.mapScreen,
                  arguments: {
                      'lon' : lon,
                      'lat' : lat,
                      'name' : name,
                  }
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: color.withOpacity(0.8),
                    size: 17.0,
                  ),
                  Text(
                    '$city-$address',
                    style: TextStyle(
                      color: color.withOpacity(0.8),
                    ),

                  ),
                ],
              ),
            ),
          ],

        ),
      ],
    );
  }
}
