import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/message_room_view_repo.dart';
import '../../repository/send_message_repo.dart';

part 'message_room_event.dart';
part 'message_room_state.dart';

class MessageRoomBloc extends Bloc<MessageRoomEvent, MessageRoomState> {


  MessageRoomViewRepo messageRoomViewRepo = MessageRoomViewRepo(Crud());
  SendMessageRepo sendMessageRepo = SendMessageRepo(Crud());
  List messages = [];

  TextEditingController messageText = TextEditingController();

  MessageRoomBloc() : super(MessageRoomInitial()) {
    on<MessageRoomEvent>((event, emit) async {

      if(event is GetMessageViewEvent){
        dynamic response;
        try{
          emit(LoadingState());
          var response = await messageRoomViewRepo.getMessage(event.roomId);
          messages.clear();
          messages.addAll(response);
          emit(GetMessagesDone(messages));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if (event is SendMessageEvent){
        dynamic response;
        try{
          await sendMessageRepo.sendMessage(messageText.text,event.roomId);
          messageText.clear();

        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
    });
  }
}
