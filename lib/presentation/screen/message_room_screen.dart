import 'package:e_clinic/core/constant/color_app.dart';
import 'package:e_clinic/core/constant/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/mesaage_room_bloc/message_room_bloc.dart';
import '../widget/message_room_widget/custom_message_view.dart';
import '../widget/primary_screen_widget/custom_circular_image.dart';

class MessageRoomScreen extends StatelessWidget {
  const MessageRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
      create: (context) => MessageRoomBloc()..add(GetMessageViewEvent(arguments['roomId'].toString())),
      child: BlocBuilder<MessageRoomBloc, MessageRoomState>(
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.0,
          leading:  Padding(
            padding: EdgeInsetsDirectional.only(start: 12.0),
            child: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(
                arguments['doctor'].image,
              ),
            ),
          ),
          title: Text(
            'د.${arguments['doctor'].name}',
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'cairo'
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<MessageRoomBloc, MessageRoomState>(
                  builder: (context, state) {
                    if(state is LoadingState){
                      return Center(
                          child: Lottie.asset(
                            AppImage.loading,
                            height: 150.sp,
                            width: 200.sp,
                          )
                      );
                    }
                    else if (state is ErrorState){
                      return Center(child: Text(state.error));
                    }
                    else if (state is GetMessagesDone){
                      return CustomMessageView(messages: state.messages,);
                    }
                    else{
                      print('sizedBox');
                      return const SizedBox();
                    }
                  },
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: AppColor.darkGreen,
                            width: 2,
                          )
                      )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: BlocProvider.of<MessageRoomBloc>(context).messageText,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0
                            ),
                            hintText: 'اكتب الرسالة هنا...',
                            border: InputBorder.none,
                          ),

                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<MessageRoomBloc>(context).add(SendMessageEvent(arguments['roomId'].toString()));
                          BlocProvider.of<MessageRoomBloc>(context).add(GetMessageViewEvent(arguments['roomId'].toString()));

                        },
                        child: const Text(
                          'ارسال',
                          style: TextStyle(
                            color: AppColor.darkGreen,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      );
  },
),
    );
  }
}
