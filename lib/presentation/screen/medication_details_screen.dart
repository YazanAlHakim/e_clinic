import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../core/constant/color_app.dart';
import '../../core/constant/image_app.dart';
import '../widget/global_widget/custom_subtitle_home.dart';

class MedicationDetailsScreen extends StatelessWidget {
  const MedicationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 230.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(34.0)),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [AppColor.darkGreen, AppColor.lightGreen]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    AppImage.medical2,
                    height: 170.0,
                    width: 300.0,
                    fit: BoxFit.fill,
                  ),
                  Text(
                      arguments['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 28.0,
                      letterSpacing: 2.0
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20.0,),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(14.0),
                  children: [
                    const CustomSubtitle(title: 'الجرعة',color: AppColor.darkGreen),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [AppColor.darkGreen, AppColor.lightGreen]),
                        borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          arguments['dose'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    const CustomSubtitle(title: 'المدة',color: AppColor.darkGreen),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [AppColor.darkGreen, AppColor.lightGreen]),
                          borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'لتاريخ ${Jiffy(arguments['duration']).format('yyyy/M/d')}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12.0,),
                    const CustomSubtitle(title: 'ملاحظات',color: AppColor.darkGreen),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 6.0,top: 6.0),
                      height: 100.0,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [AppColor.darkGreen, AppColor.lightGreen]),
                          borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: Text(
                       arguments['note'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    const Padding(
                      padding:  EdgeInsetsDirectional.only(top: 3.0,bottom: 3.0),
                      child: Divider(
                        height: 2,
                        thickness: 1.0,
                        color: AppColor.darkGreen,
                      ),
                    ),
                    Text(
                      'تم وصف هذا الدواء من قبل الدكتور ${arguments['doctorName']} لاستشارة ${arguments['title']}',
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          color: Colors.redAccent,
                        fontSize: 18,
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsetsDirectional.only(top: 3.0,bottom: 3.0),
                      child: Divider(
                        height: 2,
                        thickness: 1.0,
                        color: AppColor.darkGreen,
                      ),
                    )
                  ],

                ),
            ),
          ],
        ),
      ),
    );
  }
}


