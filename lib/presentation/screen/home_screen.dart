import 'package:e_clinic/bloc/home_bloc/home_bloc.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/image_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/costum_loading.dart';
import 'package:e_clinic/presentation/widget/home_widget/custom_specializations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widget/global_widget/custom_subtitle_home.dart';
import 'package:iconsax/iconsax.dart';
import '../widget/home_widget/custom_carousel_slider.dart';
import '../widget/home_widget/custom_view_all_doctors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetDateEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state is LoadingState){
            return  const CustomLoading();
          }
          else if (state is GetDataDone){
            return ListView(
              children: [
                const CustomSubtitle(
                    title: 'أطباء مميزين', color: AppColor.darkGreen),
                CustomCarouselSliderList(distinguishedDoctors: state.distinguishedDoctors,),
                SizedBox(
                  height: 2.h,
                ),
                const CustomSubtitle(
                    title: 'طلب استشارة عامة :', color: AppColor.darkGreen),
                CustomSpecializations(specializations: state.specializations),
                SizedBox(
                  height: 2.h,
                ),
                const CustomSubtitle(
                    title: 'طلب استشارة خاصة :', color: AppColor.darkGreen),
                 CustomViewAllDoctors(specializations: state.specializations),
              ],
            );
          }
          else if (state is ErrorState){
            return Scaffold(body: Center(child: Text(state.error)));
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
