import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/routes_app.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/Patient_bloc/patient_bloc.dart';
import '../widget/global_widget/costum_loading.dart';
import '../widget/patient_widget/custom_column_text_field.dart';
import '../widget/patient_widget/custom_text_form_field.dart';
import '../widget/patient_widget/custom_title_form.dart';
import '../widget/patient_widget/custom_toggle_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var  arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<PatientBloc, PatientState>(
        builder: (context, state) {
          if(state is LoadingState){
            return const CustomLoading();
          }
          else{
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColor.lightGreen,
                    title: Text(
                      'ملء المعلومات',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cairo',
                          fontSize: 12.sp),
                    ),
                    centerTitle: true,
                    bottom: const TabBar(
                      indicatorColor: AppColor.darkGreen,
                      indicatorWeight: 4.0,
                      tabs: [
                        Tab(
                          child: Text('الشخصية'),
                        ),
                        Tab(
                          child: Text('الطبية'),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      //المعلومات الشخصية
                      ListView(
                        padding: const EdgeInsets.all(14.0),
                        children: [
                          const CustomTitleForm(title: 'الاسم الثلاثي'),
                          CustomFormField(
                            textFieldController: BlocProvider.of<PatientBloc>(context).name,
                            flag: true,
                            keyboardType: TextInputType.name,
                          ),
                          const CustomTitleForm(title: 'رقم الهاتف'),
                          CustomFormField(
                            textFieldController: BlocProvider.of<PatientBloc>(context).phone,
                            flag: true,
                            keyboardType: TextInputType.number,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              CustomColumnTextField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).age,
                                title: 'العمر',
                                keyboardType: TextInputType.number,
                              ),
                              CustomColumnTextField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).height,
                                title: 'الطول-سم',
                                keyboardType: TextInputType.number,
                              ),
                              CustomColumnTextField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).weight,
                                title: 'الوزن-كغ',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                          CustomToggleWidget(
                            text1: 'ذكر',
                            text2: 'انثى',
                            withIcon: true,
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context).add(const GenderEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context).add(const GenderEvent(false));
                            },
                            active:
                            BlocProvider.of<PatientBloc>(context).gender,
                          ),
                          CustomToggleWidget(
                            text1: 'متزوج',
                            text2: 'عازب',
                            withIcon: false,
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const MarriedEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const MarriedEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context).married,
                          ),
                          const CustomTitleForm(title: 'العنوان بالتفصيل'),
                          CustomFormField(
                            textFieldController: BlocProvider.of<PatientBloc>(context).address,
                            flag: true,
                            keyboardType: TextInputType.name,
                          ),
                        ],
                      ),

                      //المعلومات الطبية
                      ListView(
                        padding: const EdgeInsets.all(14.0),
                        children: [
                          const CustomTitleForm(title: 'ممارسة عادات غير صحية'),
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, mainAxisExtent: 48.0),
                            children: [
                              Row(
                                children: [
                                  const Text('تدخين'),
                                  Checkbox(
                                      activeColor: AppColor.lightGreen,
                                      value: BlocProvider.of<PatientBloc>(context).smoking,
                                      onChanged: (value) {
                                        BlocProvider.of<PatientBloc>(context).add(SmokingEvent(value!));

                                      }
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('ارجيلة'),
                                  Checkbox(
                                      activeColor: AppColor.lightGreen,
                                      value: BlocProvider.of<PatientBloc>(context).bubbly,
                                      onChanged: (value) {
                                        BlocProvider.of<PatientBloc>(context).add(BubblyEvent(value!));
                                      }
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('كحول'),
                                  Checkbox(
                                      activeColor: AppColor.lightGreen,
                                      value:  BlocProvider.of<PatientBloc>(context).alcohol,
                                      onChanged: (value) {
                                        BlocProvider.of<PatientBloc>(context).add(AlcoholEvent(value!));
                                      }
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('منبهات'),
                                  Checkbox(
                                      activeColor: AppColor.lightGreen,
                                      value:  BlocProvider.of<PatientBloc>(context).stimulant,
                                      onChanged: (value) {
                                        BlocProvider.of<PatientBloc>(context).add(StimulantEvent(value!));
                                      }
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('غير ذلك'),
                                  Checkbox(
                                      activeColor: AppColor.lightGreen,
                                      value:  BlocProvider.of<PatientBloc>(context).otherWise,
                                      onChanged: (value) {
                                        BlocProvider.of<PatientBloc>(context).add(OtherWiseEvent(value!));
                                      }
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Visibility(
                            visible: BlocProvider.of<PatientBloc>(context).otherWise,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).otherWiseText,
                                hint: 'ادخل عادات سيئة اخرى',
                                flag: false,
                                keyboardType: TextInputType.text
                            ),
                          ),
                          const CustomTitleForm(
                              title: 'هل تتناول دواء بشكل دائم'),
                          CustomToggleWidget(
                            withIcon: false,
                            text1: 'نعم',
                            text2: 'لا',
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const PermanentMedicineEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const PermanentMedicineEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context)
                                .permanentMedicine,
                          ),
                          Visibility(
                            visible: BlocProvider.of<PatientBloc>(context)
                                .permanentMedicine,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).permanentMedicineText,
                                hint: 'أدخل اسم الادوية',
                                flag: false,
                                keyboardType: TextInputType.text),
                          ),
                          const CustomTitleForm(
                              title: 'هل اجريت عملية جراحية من قبل'),
                          CustomToggleWidget(
                              withIcon: false,
                              text1: 'نعم',
                              text2: 'لا',
                              onClickYes: () {
                                BlocProvider.of<PatientBloc>(context)
                                    .add(const SurgeryEvent(true));
                              },
                              onClickNo: () {
                                BlocProvider.of<PatientBloc>(context)
                                    .add(const SurgeryEvent(false));
                              },
                              active: BlocProvider.of<PatientBloc>(context)
                                  .surgery),
                          Visibility(
                            visible:
                            BlocProvider.of<PatientBloc>(context).surgery,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).surgeryText,
                                hint: 'أدخل العمليات الجراحية',
                                flag: false,
                                keyboardType: TextInputType.text),
                          ),
                          const CustomTitleForm(
                              title: 'هل لديك ارتفاع ضغط شرياني'),
                          CustomToggleWidget(
                            withIcon: false,
                            text1: 'نعم',
                            text2: 'لا',
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const HighBloodPressureEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const HighBloodPressureEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context)
                                .highBloodPressure,
                          ),
                          const CustomTitleForm(title: 'هل لديك مرض السكري'),
                          CustomToggleWidget(
                            withIcon: false,
                            text1: 'نعم',
                            text2: 'لا',
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const DiabetesEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const DiabetesEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context)
                                .diabetes,
                          ),
                          const CustomTitleForm(title: 'هل يوجد امراض وراثية'),
                          CustomToggleWidget(
                              withIcon: false,
                              text1: 'نعم',
                              text2: 'لا',
                              onClickYes: () {
                                BlocProvider.of<PatientBloc>(context)
                                    .add(const GeneticDiseasesEvent(true));
                              },
                              onClickNo: () {
                                BlocProvider.of<PatientBloc>(context)
                                    .add(const GeneticDiseasesEvent(false));
                              },
                              active: BlocProvider.of<PatientBloc>(context)
                                  .geneticDiseases),
                          Visibility(
                            visible: BlocProvider.of<PatientBloc>(context)
                                .geneticDiseases,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).geneticDiseasesText,
                                hint: 'أدخل الامراض الوراثية',
                                flag: false,
                                keyboardType: TextInputType.text),
                          ),
                          const CustomTitleForm(title: 'هل يوجد لقاحات'),
                          CustomToggleWidget(
                            withIcon: false,
                            text1: 'نعم',
                            text2: 'لا',
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const VaccinesEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const VaccinesEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context)
                                .vaccines,
                          ),
                          Visibility(
                            visible: BlocProvider.of<PatientBloc>(context)
                                .vaccines,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).vaccinesText,
                                hint: 'أدخل اللقاحات الحديثة',
                                flag: false,
                                keyboardType: TextInputType.text),
                          ),
                          const CustomTitleForm(
                              title: 'هل يوجد حساسية تجاه دواء معين او شيء اخر'),
                          CustomToggleWidget(
                            withIcon: false,
                            text1: 'نعم',
                            text2: 'لا',
                            onClickYes: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const SensitiveEvent(true));
                            },
                            onClickNo: () {
                              BlocProvider.of<PatientBloc>(context)
                                  .add(const SensitiveEvent(false));
                            },
                            active: BlocProvider.of<PatientBloc>(context)
                                .sensitive,
                          ),
                          Visibility(
                            visible: BlocProvider.of<PatientBloc>(context)
                                .sensitive,
                            child: CustomFormField(
                                textFieldController: BlocProvider.of<PatientBloc>(context).sensitiveText,
                                hint: 'أدخل الادوية او اي شيء اخر تتحسس منه',
                                flag: false,
                                keyboardType: TextInputType.text),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          CustomButton(
                            text: 'تأكيد',
                            onTab: () {
                              BlocProvider.of<PatientBloc>(context).add(RegisterEvent(
                                arguments['email'],
                                arguments['password'],
                                arguments['cityId']
                              ));
                              //Navigator.pushNamedAndRemoveUntil(context, AppRoutes.primaryScreen, (route) => false);
                            },
                          )
                        ],
                      ),
                    ],
                  )),
            );
          }
        },
        listener:  (context, state){
          if(state is RegisterFormDoneState){
            AnimatedSnackBar.material(
              'تم انشاء الحساب بنجاح',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: const Duration(seconds: 5),
            ).show(context);
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.primaryScreen, (route) => false);
          }
          }
    );
  }
}
