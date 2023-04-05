import 'package:e_clinic/bloc/medication_bloc/medication_bloc.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/image_app.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/costum_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../widget/global_widget/custom_subtitle_home.dart';
import '../widget/medication_widget/custom_medication_list.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicationBloc()..add(GetMedicationEvent()),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CustomSubtitle(title: 'أدويتي', color: AppColor.darkGreen),
           BlocBuilder<MedicationBloc, MedicationState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                    child: Lottie.asset(
                      AppImage.loading,
                      height: 150.sp,
                      width: 200.sp,
                    )
                );
              } else if (state is GetMedicationDone) {
                return CustomMedicationList(medications: state.medication);
              } else if (state is ErrorState) {
                return  Center(child: Text(state.error));
              } else {
                return const SizedBox();
              }
            },
          ),
        ]
      ),
    );
  }
}
