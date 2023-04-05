import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/presentation/widget/doctor_widget/bar_of_doctor.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_button.dart';
import 'package:e_clinic/presentation/widget/primary_screen_widget/custom_fab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/doctor_details_bloc/doctor_details_bloc.dart';
import '../widget/doctor_widget/custom_contact.dart';
import '../widget/doctor_widget/custom_description.dart';
import '../widget/doctor_widget/custom_divider.dart';
import '../widget/doctor_widget/custom_row_details.dart';
import '../widget/doctor_widget/doctor_details.dart';
import '../widget/doctor_widget/title_of_details.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsScreen extends StatelessWidget {


  DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<DoctorDetailsBloc, DoctorDetailsState>(
        listener: (context, state) {
          if (state is SendPrivateCompliantDone) {
            AnimatedSnackBar.material(
              'تم ارسال شكوتك بنجاح',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: const Duration(seconds: 5),
            ).show(context);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.lightGreen,
            floatingActionButton: CustomFabButton(
                title: 'استشارة',
                onTab: () {
                  Navigator.pushNamed(context, AppRoutes.consultationScreen,
                      arguments: {
                        'doctorId': arguments['doctorData'].id,
                        'specializationsId':
                            arguments['doctorData'].specialization.id,
                      });
                }),
            body: SafeArea(
              child: Column(
                children: [
                  TitleOfDetails(
                    //arguments['doctorData'].specialization.name
                    title:
                        'اختصاص : ${arguments['doctorData'].specialization.name}',
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40.0))),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DoctorDetails(
                                  image: arguments['doctorData'].image,
                                  name: arguments['doctorData'].name,
                                  specialization: arguments['doctorData'].specialization.name,
                                  address: arguments['doctorData'].fullAddress,
                                  city: arguments['doctorData'].city.name,
                                  lon: arguments['doctorData'].lon,
                                  lat: arguments['doctorData'].lat,
                                  flag: false,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0)),
                                          ),
                                          alignment:
                                              AlignmentDirectional.center,
                                          contentPadding:
                                              const EdgeInsetsDirectional.only(
                                                  top: 20.0,
                                                  start: 42.0,
                                                  end: 42.0,
                                                  bottom: 10.0),
                                          title: const Text(
                                            "شكوى على طبيب",
                                            style:
                                                TextStyle(fontFamily: 'cairo'),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller: BlocProvider.of<
                                                              DoctorDetailsBloc>(
                                                          context)
                                                      .controller,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  minLines: 1,
                                                  maxLines: 5,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'ادخل تفاصيل الشكوى هنا...',
                                                    hintStyle: TextStyle(
                                                        fontFamily: 'cairo'),
                                                    border: InputBorder.none,
                                                    fillColor: Color.fromRGBO(
                                                        217, 217, 217, 1),
                                                    filled: true,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                bottom: 150.0,
                                                                end: 12.0,
                                                                top: 16.0,
                                                                start: 12.0),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 6.0,
                                                ),
                                                CustomButton(
                                                    text: 'تأكيد',
                                                    onTab: () {
                                                      BlocProvider.of<
                                                                  DoctorDetailsBloc>(
                                                              context)
                                                          .add(
                                                              SendPrivateCompliantEvent(
                                                        arguments['doctorData']
                                                            .id
                                                            .toString(),
                                                        BlocProvider.of<
                                                                    DoctorDetailsBloc>(
                                                                context)
                                                            .controller
                                                            .text,
                                                      ));
                                                    }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Iconsax.warning_2,
                                      color: Colors.red,
                                      size: 28.0,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          BarOfDoctor(
                            consulting: arguments['doctorData'].numConsulting,
                            posts: arguments['doctorData'].numPost,
                            rate: arguments['doctorData'].rate,
                            height: 60.0,
                            paddingHorizontal: 20.0,
                            color: AppColor.lightGreen,
                            textColor: Colors.white,
                          ),
                          const CustomDivider(
                            paddingTop: 20.0,
                            paddingBottom: 14.0,
                          ),
                          Text(
                            arguments['doctorData'].mainTitle,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ),
                          const CustomDivider(
                            paddingTop: 14.0,
                            paddingBottom: 10.0,
                          ),
                          const CustomRowDetails(
                            icon: Iconsax.personalcard,
                            text: 'الوصف',
                          ),
                          CustomDescription(
                              description: arguments['doctorData'].title),
                          const CustomRowDetails(
                            icon: Iconsax.call,
                            text: 'معلومات الاتصال',
                          ),
                          CustomContact(
                            text: 'جوال',
                            number: arguments['doctorData'].mobileNumber,
                          ),
                          CustomContact(
                            text: 'أرضي',
                            number: arguments['doctorData'].clinicNumber,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
    );
  }
}
