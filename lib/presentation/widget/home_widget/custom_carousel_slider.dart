import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color_app.dart';
import '../../../core/constant/image_app.dart';
import '../../../model/DistinguishedDoctors.dart';

class CustomCarouselSliderList extends StatelessWidget {
  final List <DistinguishedDoctorsModel>distinguishedDoctors;
  const CustomCarouselSliderList({Key? key, required this.distinguishedDoctors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              scrollDirection: Axis.horizontal,
              reverse: false,
              viewportFraction: 1,
              height: 150.0,
            ),
            items:distinguishedDoctors.map((e) => Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  width: double.infinity,
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: AppColor.lightGreen,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.sex == 0 ? 'الدكتور ${e.name}' : 'الدكتورة ${e.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 1,
                                fontFamily: 'cairo',
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                               'اخصائي ${e.specialization!.name}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white70,
                                  fontFamily: 'cairo',
                                ),
                              ),
                            ),
                            Text(
                              e.openingTime!,
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.white70,
                                fontFamily: 'cairo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 20,
                        child: Container(
                          margin: EdgeInsetsDirectional.only(end: 30.w),
                          decoration: const BoxDecoration(
                            color: AppColor.darkGreen,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(10.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e.numPost.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Icon(
                                    Iconsax.personalcard,
                                    color: Colors.white,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    e.rate.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Icon(
                                    Iconsax.star,
                                    color: Colors.white,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    e.numConsulting.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Icon(
                                    Iconsax.eye,
                                    color: Colors.white,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10.0)),
                    child: Image.asset(
                      e.sex == 0 ?AppImage.manDoctor : AppImage.womenDoctor,
                      height: 150.0,
                      width: 30.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            )).toList()
          );
  }
}

