import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color_app.dart';
import '../../../core/constant/image_app.dart';
import '../../../model/specializations_model.dart';

class CustomViewAllDoctors extends StatelessWidget {
  final List specializations;
  List <SpecializationsModel> specializationsValue = [];
   CustomViewAllDoctors({Key? key, required this.specializations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        specializationsValue = specializations.map((item) => SpecializationsModel.fromJson(item)).toList();
        print(specializationsValue);
        Navigator.pushNamed(
            context,
            AppRoutes.doctors,
            arguments: {
              'specialization' : specializationsValue,
            }
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  height: 10.h,
                  width: 58.w,
                  color: AppColor.lightGreen,
                  child: Text(
                    'عرض كافة الأطباء',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontFamily: 'cairo'
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      height: 12.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                          color: AppColor.lightGreen,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(80.0),
                            topEnd: Radius.circular(30.0),
                          )
                      ),

                    ),
                  ),
                  Positioned(
                    bottom: -17.0,
                    child: Image.asset(
                      AppImage.doctors,
                      height: 130.0,
                      width: 116.0,
                      fit: BoxFit.fill,
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


class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    final path = Path();
    path.moveTo(size.width*0.9975000,size.height*0.0020000);
    path.lineTo(size.width*0.4337500,size.height*0.0020000);
    path.quadraticBezierTo(size.width*0.2581250,size.height*0.1995000,size.width*0.4912500,size.height*0.5220000);
    path.cubicTo(size.width*0.5803125,size.height*0.5930000,size.width*0.7690625,size.height*0.6045000,size.width*0.8387500,size.height*0.5780000);
    path.quadraticBezierTo(size.width*1.0137500,size.height*0.5490000,size.width,size.height*0.3580000);
    path.lineTo(size.width*0.9975000,size.height*0.0020000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

