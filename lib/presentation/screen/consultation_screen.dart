import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/bloc/consultation_bloc/consultation_bloc.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/costum_loading.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_button.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../core/constant/color_app.dart';
import '../widget/consultation_widget/custom_consultation_title.dart';
import '../widget/consultation_widget/custom_grid_radio_button.dart';
import '../widget/consultation_widget/custom_radio_button_bar.dart';
import '../widget/consultation_widget/custom_three_button.dart';
import '../widget/patient_widget/custom_text_form_field.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
      create: (context) => ConsultationBloc(),
      child: BlocConsumer<ConsultationBloc, ConsultationState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const CustomLoading();
          } else if (state is ErrorState) {
            return CustomError(error: state.error);
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'ملف الاستشارة',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'cairo',
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: BlocBuilder<ConsultationBloc, ConsultationState>(
                builder: (context, state) {
                  return ListView(
                    padding: const EdgeInsets.all(14.0),
                    children: [
                      const CustomConsultationTitle(
                        title: 'عنوان الشكوى',
                      ),
                      CustomFormField(
                        hint: 'أدخل عنوان شكوتك الرئيسي',
                        keyboardType: TextInputType.text,
                        flag: false,
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationTitleText,
                      ),
                      const CustomConsultationTitle(
                        title: 'نوع الشكوى',
                      ),
                      CustomRadioButtonBar(
                        value1: 'ألم',
                        value2: 'اخرى',
                        groupValue: BlocProvider.of<ConsultationBloc>(context)
                                    .type !=
                                null
                            ? BlocProvider.of<ConsultationBloc>(context).type!
                            : 'sdvs ',
                        onChange: (value) {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(ChangeTypeEvent(value!));
                        },
                      ),
                      const CustomConsultationTitle(
                        title: 'وصف الشكوى/الاستشارة',
                      ),
                      CustomFormField(
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationDetailsText,
                        hint: 'تفاصيل الشكوى',
                        keyboardType: TextInputType.text,
                        flag: false,
                      ),
                      CustomFormField(
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationTimeText,
                        hint: 'متى بدأت الشكوى',
                        keyboardType: TextInputType.text,
                        flag: false,
                      ),
                      const CustomConsultationTitle(
                        title: 'تطور الشكوى',
                      ),
                      CustomThreeButton(
                        value1: 'تزداد',
                        value2: 'تنقص',
                        value3: 'كما هي',
                        groupValue: BlocProvider.of<ConsultationBloc>(context)
                                    .update !=
                                null
                            ? BlocProvider.of<ConsultationBloc>(context).update!
                            : 'sdvs ',
                        onChange: (value) {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(ChangeUpdateEvent(value!));
                        },
                      ),
                      const CustomConsultationTitle(
                        title: 'تواتر الشكوى',
                      ),
                      CustomGridRadioButton(
                        value1: 'مستمر',
                        value2: 'كل يوم',
                        value3: 'كل اسبوع',
                        value4: 'كل شهر',
                        groupValue: BlocProvider.of<ConsultationBloc>(context)
                                    .frequency !=
                                null
                            ? BlocProvider.of<ConsultationBloc>(context)
                                .frequency!
                            : 'sdvs ',
                        onChange: (value) {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(ChangeFrequencyEvent(value!));
                        },
                      ),
                      CustomFormField(
                        hint: 'عوامل تزيد الشكوى',
                        keyboardType: TextInputType.text,
                        flag: false,
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationFactorsIncreaseText,
                      ),
                      CustomFormField(
                        hint: 'عوامل تقلل الشكوى',
                        keyboardType: TextInputType.text,
                        flag: false,
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationFactorsReduceText,
                      ),
                      CustomFormField(
                        hint: 'مكان الالم',
                        keyboardType: TextInputType.text,
                        flag: false,
                        textFieldController:
                            BlocProvider.of<ConsultationBloc>(context)
                                .consultationPlaceText,
                      ),
                      const CustomConsultationTitle(
                        title: 'شدة الالم',
                      ),
                      CustomGridRadioButton(
                        value1: 'خفيف',
                        value2: 'متوسط',
                        value3: 'شديد',
                        value4: 'شديد جدا',
                        groupValue: BlocProvider.of<ConsultationBloc>(context)
                                    .severityPain !=
                                null
                            ? BlocProvider.of<ConsultationBloc>(context)
                                .severityPain!
                            : 'sdvs ',
                        onChange: (value) {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(ChangeSeverityPainEvent(value!));
                        },
                      ),
                      const CustomConsultationTitle(
                        title: 'طبيعة الالم',
                      ),
                      CustomThreeButton(
                        value1: 'نابض',
                        value2: 'حارق',
                        value3: 'عاصر',
                        groupValue: BlocProvider.of<ConsultationBloc>(context)
                                    .naturePain !=
                                null
                            ? BlocProvider.of<ConsultationBloc>(context)
                                .naturePain!
                            : 'sdvs ',
                        onChange: (value) {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(ChangeNaturePainEvent(value!));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'اذا كانت الشكوى عبارة عن افة او مرض جلدي يرجى ارفاق صورة , كما يرجى ارفاق التحاليل الطبية ان وجدت :',
                          style: TextStyle(
                              color: AppColor.darkGreen,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<ConsultationBloc>(context)
                              .add(UploadImage());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColor.lightGreen,
                          radius: 26.0,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocBuilder<ConsultationBloc, ConsultationState>(
                        builder: (context, state) {
                          if (state is UploadImageState) {
                            return Row(
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Wrap(
                                      spacing: 12.0,
                                    children: state.image.map((item){
                                      return Image.file(
                                          File(item.path),
                                         height: 120.0,
                                        width: 140.0,
                                        fit: BoxFit.fill,
                                      );
                                    }).toList(),
                                ),
                                  ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: CustomButton(
                            text: 'ارسال الشكوى الى الطبيب',
                            onTab: () {
                              BlocProvider.of<ConsultationBloc>(context)
                                  .add(SendConsultationEvent(
                                arguments['doctorId'].toString(),
                                arguments['specializationsId'].toString(),
                                //specializationId
                              ));
                            }),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is SendConsultationDoneState) {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              title: 'تم ارسال استشارتك بنجاح',
              desc:
                  'سوف يتم الاجابة على استشارتك من الطبيب المختص في أقرب وقت ممكن تمنياتنا لك بالشفاء العاجل ان شاء الله...',
              descTextStyle: const TextStyle(fontFamily: 'cairo'),
              btnOkOnPress: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.primaryScreen, (route) => false);
              },
            ).show();
          }
        },
      ),
    );
  }
}
