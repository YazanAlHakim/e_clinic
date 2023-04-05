import 'package:e_clinic/core/constant/color_app.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../model/message_room_model.dart';

class CustomMessageView extends StatelessWidget {
  final List messages;
  const CustomMessageView({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsetsDirectional.only(start: 10.0, top: 20.0, end : 10.0, bottom : 10.0),
            itemCount: messages.length,
            separatorBuilder: (context,index){
              return const SizedBox(height: 6.0,);
            },
            itemBuilder: (context,index){
              return Message(
                  messageRoomModel:MessageRoomModel.fromJson(messages[index]),
              );
            }
        )
    );
  }
}


class Message extends StatelessWidget {
  final MessageRoomModel messageRoomModel;
  const Message({Key? key, required this.messageRoomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: messageRoomModel.userId == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Material(
          borderRadius: BorderRadius.only(
             topLeft: messageRoomModel.userId == 0 ? const Radius.circular(30.0) : const Radius.circular(0.0) ,
             topRight: messageRoomModel.userId == 0 ? const Radius.circular(0.0) : const Radius.circular(30.0),
             bottomLeft: const Radius.circular(30.0),
             bottomRight: const Radius.circular(30.0),

          ),
          elevation: 5,
          color: messageRoomModel.userId == 0 ? AppColor.lightGreen : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 17.0),
            child: Text(
              messageRoomModel.body!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 3.0,),
        Padding(
          padding: messageRoomModel.userId == 0 ? const EdgeInsetsDirectional.only(start: 3) : const EdgeInsetsDirectional.only(end: 3),
          child: Text(
            Jiffy(messageRoomModel.createdAt).format('h:mm a'),
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12.0
            ),
          ),
        ),
      ],
    );
  }
}

