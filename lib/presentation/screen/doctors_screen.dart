import 'package:e_clinic/bloc/doctor_bloc/doctor_bloc.dart';
import 'package:e_clinic/core/constant/color_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../core/constant/image_app.dart';
import '../widget/doctor_widget/custom_doctor_list.dart';


class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
        create: (context) => DoctorBloc()..add(GetDoctorEvent()),
        child: BlocBuilder<DoctorBloc, DoctorState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      height: 210.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColor.lightGreen,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(34.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'بحث عن طبيب :',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'cairo',
                                color: Colors.white),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 25.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'ادخل اسم الطبيب',
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColor.darkGreen,
                                  size: 20.0,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                focusColor: AppColor.darkGreen,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: AppColor.darkGreen,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: AppColor.darkGreen,
                                    width: 2.0,
                                  ),
                                ),
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: arguments['specialization'].length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 8.0,
                                );
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<DoctorBloc>(context)
                                        .add(GetFilterDoctor(
                                      arguments['specialization'][index].id.toString(),
                                      index,
                                    ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13.0),
                                    decoration: BoxDecoration(
                                        color: BlocProvider.of<DoctorBloc>(context).selected == index
                                                ? Colors.white
                                                : AppColor.lightGreen,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        arguments['specialization'][index].name,
                                        style: TextStyle(
                                            color: BlocProvider.of<DoctorBloc>(context).selected == index
                                                ? AppColor.darkGreen
                                                : Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<DoctorBloc, DoctorState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return  Center(
                              child: Lottie.asset(
                                AppImage.loading,
                                height: 150.sp,
                                width: 200.sp,
                              )
                          );
                        }
                        else if (state is GetDoctorDone) {
                          return Expanded(child: CustomDoctorList(doctors: state.doctors));
                        } else if (state is ErrorState) {
                          return  Center(child: Text(state.error));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
