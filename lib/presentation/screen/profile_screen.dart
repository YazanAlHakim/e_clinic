import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/presentation/widget/primary_screen_widget/custom_circular_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/message_bloc/message_bloc.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';
import '../../main.dart';
import '../widget/global_widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
  listener: (context, state) {
    if(state is SendPublicCompliantDone){
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
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: Container(
              height: 34.h,
              padding: const EdgeInsets.all(12.0),
             color: AppColor.lightGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCircularImage(image: prefs.getString('image')!),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          prefs.getString('name')!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 1.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Text(
                            'تسجيل خروج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontFamily: 'cairo'

                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Container(
                          width: 28.w,
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                 BlocProvider.of<MessageBloc>(context).waitingConsultation.length.toString(),
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12.sp
                                 ),
                              ),
                              Text(
                                'قيد الانتظار',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 28.w,
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                BlocProvider.of<MessageBloc>(context).roomView.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp
                                ),
                              ),
                              Text(
                                'قيد المعالجة',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 28.w,
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                BlocProvider.of<MessageBloc>(context).finishConsultation.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp
                                ),
                              ),
                              Text(
                                'منتهية',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              ),
                              alignment: AlignmentDirectional.center,
                              contentPadding: const EdgeInsetsDirectional.only(
                                  top: 20.0, bottom: 10.0),
                              title: const Text(
                                "شكوى",
                                style: TextStyle(fontFamily: 'cairo'),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DropdownButtonFormField(
                                      items: [
                                        'شكوى بخصوص استشارة قيد الانتظار',
                                        'شكوى بخصوص استشارة منتهية',
                                        'اخرى',
                                      ].map(
                                            (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.start,
                                            )),
                                      ).toList(),
                                      onChanged: (value) {
                                          if(value == 'شكوى بخصوص استشارة قيد الانتظار') {
                                            print('yessssss');
                                            BlocProvider.of<ProfileBloc>(context).typeCompliant = 'waiting';
                                          } else if (value == 'شكوى بخصوص استشارة منتهية'){
                                            BlocProvider.of<ProfileBloc>(context).typeCompliant = 'finished';
                                          }else{
                                            BlocProvider.of<ProfileBloc>(context).typeCompliant = 'other';
                                          }
                                      },
                                      hint: const Text('نوع الشكوى'),
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.warning_amber_rounded),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 4.0),
                                      ),
                                      validator: (value) {},
                                    ),
                                    const SizedBox(height: 16.0,),
                                    TextFormField(
                                      controller: BlocProvider.of<ProfileBloc>(context).controller,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 1,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        hintText: 'ادخل تفاصيل الشكوى هنا...',
                                        hintStyle: TextStyle(fontFamily: 'cairo'),
                                        border: InputBorder.none,
                                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                                        filled: true,
                                        isDense: true,
                                        contentPadding: EdgeInsetsDirectional.only(
                                            bottom: 150.0, end: 12.0, top: 16.0, start: 12.0),
                                      ),
                                    ),
                                    const SizedBox(height: 6.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            text: 'تأكيد',
                                            onTab: (){
                                                BlocProvider.of<ProfileBloc>(context).add(SendPublicComplaint(
                                                    BlocProvider.of<ProfileBloc>(context).typeCompliant,
                                                    BlocProvider.of<ProfileBloc>(context).controller.text,
                                                )
                                                );
                                            }
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'ارسال شكوى',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          Text(
                            'تعديل الملف الشخصي',
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 10.sp
                            ),
                          )
                        ],
                      ),


                    ],
                  ),

                ],
              ),
            ),
          ),
          Flexible(
              child: Container(

              ),
          )
        ],
      ),
    );
  },
);
  }
}
