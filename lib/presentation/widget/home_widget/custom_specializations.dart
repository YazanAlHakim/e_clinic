import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';
import '../../../model/specializations_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomSpecializations extends StatelessWidget {

  final List specializations;
  const CustomSpecializations({Key? key, required this.specializations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.5.w,
          mainAxisSpacing: 4.5.w,
          mainAxisExtent: 11.6.h
      ),
      itemCount: specializations.length,
      itemBuilder: (context , index){
        return Specializations(
          specializationsModel: SpecializationsModel.fromJson(specializations[index]),
          i: index,
        );
      },


    );
  }
}


class Specializations extends StatelessWidget {
  final SpecializationsModel specializationsModel;
  final int i;
  const Specializations({Key? key, required this.specializationsModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            AppRoutes.consultationScreen,
          arguments: {
              'doctorId' : '',
              'specializationsId' : specializationsModel.id,
          }
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGreen,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(
              imageUrl: '${specializationsModel.image}',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 30.sp,
              width: 30.sp,
            ),
            Text(
              specializationsModel.name!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'cairo',
                fontSize: 10.sp,

              ),
            )
          ],
        ),
      ),
    );
  }
}




// Container(
// decoration: BoxDecoration(
// color: AppColor.lightGreen,
// borderRadius: BorderRadius.circular(14.0),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Icon(
// Iconsax.heart,
// size: 32.sp,
// color: Colors.black,
// ),
// Text(
// 'قلبية',
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'cairo',
// fontSize: 10.sp,
//
// ),
// )
// ],
// ),
// ),





// GridView(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 4,
//       crossAxisSpacing: 4.5.w,
//       mainAxisSpacing: 4.5.w,
//       mainAxisExtent: 11.6.h),
//   children: [
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Iconsax.heart,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'cairo',
//               fontSize: 10.sp,
//             ),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         color: AppColor.lightGreen,
//         borderRadius: BorderRadius.circular(14.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(
//             Icons.home,
//             size: 32.sp,
//             color: Colors.black,
//           ),
//           Text(
//             'قلبية',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'cairo',
//                 fontSize: 10.sp),
//           )
//         ],
//       ),
//     ),
//   ],
// ),