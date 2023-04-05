import 'package:e_clinic/bloc/message_bloc/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../core/constant/image_app.dart';
import '../../main.dart';
import '../widget/message_widget/custom_change_type.dart';
import '../widget/message_widget/custom_finish_consultation_list.dart';
import '../widget/message_widget/custom_room_view_list.dart';
import '../widget/message_widget/custom_wating_Consultation_list.dart';
import '../widget/primary_screen_widget/custom_circular_image.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top : 4.0),
                  child: Row(
                    children: [
                      CustomCircularImage(image: prefs.getString('image')!),
                      const SizedBox(width: 6.0,),
                      Text(
                        'اهلا بعودتك ${prefs.getString('name')}',
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomChangeType(
                  type: BlocProvider.of<MessageBloc>(context).currentType!,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(16.0),
                          topStart: Radius.circular(16.0)),
                    ),
                    child: BlocBuilder<MessageBloc, MessageState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(
                              child: Lottie.asset(
                                AppImage.loading,
                                height: 150.sp,
                                width: 200.sp,
                              )
                          );
                        }
                        else if (state is GetWaitingConsultationDoneState) {
                          return CustomWaitingConsultationList(waitingConsultation: state.waitingConsultation,);
                        }
                        else if (state is GetRoomViewDoneState) {
                          return CustomRoomViewList(
                            roomView: state.roomView,
                          );
                        }
                        else if (state is GetFinishConsultationDoneState) {
                          return CustomFinishConsultationList(
                            finishConsultation: state.finishConsultation,
                          );
                        }
                        else if (state is ErrorState) {
                          return Center(child: Text(state.error));
                        }
                        else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
      ),
    );
  }
}
