import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_clinic/presentation/widget/global_widget/costum_loading.dart';
import 'package:e_clinic/presentation/widget/global_widget/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/post_question_bloc/post_question_bloc.dart';
import '../../core/constant/color_app.dart';
import '../widget/global_widget/custom_button.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  @override
  void initState() {
    BlocProvider.of<PostQuestionBloc>(context).add(GetSpecializationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostQuestionBloc, PostQuestionState>(
      builder: (context, state) {
        if (state is PostQuestionLoadingState){
          return const CustomLoading();
        }
        else if (state is ErrorState){
          return CustomError(error: state.error);
        }
        else {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.lightGreen,
              ),
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text(
                      'أدخل سؤالك',
                      style: TextStyle(
                          color: AppColor.darkGreen,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 14.0, bottom: 14.0),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SwitchListTile(
                          value: BlocProvider.of<PostQuestionBloc>(context)
                              .unknown,
                          title: const Text(
                            'نشر ك مجهول',
                            style: TextStyle(fontFamily: 'cairo'),
                          ),
                          onChanged: (value) {
                            BlocProvider.of<PostQuestionBloc>(context)
                                .add(ChangeSwitchEvent(value));
                          }),
                    ),
                    TextFormField(
                      controller:
                      BlocProvider.of<PostQuestionBloc>(context).question,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'أدخل السؤال هنا...',
                        hintStyle: TextStyle(fontFamily: 'cairo'),
                        border: InputBorder.none,
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsetsDirectional.only(
                            bottom: 150.0, end: 12.0, top: 16.0, start: 12.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      child: DropdownButtonFormField(
                        items: BlocProvider.of<PostQuestionBloc>(context)
                            .specializationsValue
                            .map(
                              (e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(
                                e.name!,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.start,
                              )),
                        )
                            .toList(),
                        onChanged: (value) {
                          for (var element
                          in BlocProvider.of<PostQuestionBloc>(context)
                              .specializationsValue) {
                            if (element.name == value) {
                              BlocProvider.of<PostQuestionBloc>(context)
                                  .selectedSpecializationId =
                                  element.id.toString();
                            }
                          }
                        },
                        hint: const Text('اختر تخصص سؤالك'),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.medication),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 4.0),
                        ),
                        validator: (value) {},
                      ),
                    ),
                    CustomButton(
                      text: 'نشر',
                      onTab: () {
                        BlocProvider.of<PostQuestionBloc>(context)
                            .add(AddQuestionEvent());
                      },
                    ),
                  ],
                ),
              )
          );
        }
      },
      listener:  (context, state){
        if(state is AddQuestionDoneState){
          AnimatedSnackBar.material(
            'تم اضافة سؤالك بنجاح',
            type: AnimatedSnackBarType.success,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: const Duration(seconds: 5),
          ).show(context);
          Navigator.pop(context);
          BlocProvider.of<PostQuestionBloc>(context).add(GetQuestionEvent());
        }
      },

    );
  }
}
