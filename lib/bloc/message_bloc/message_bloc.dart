import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:e_clinic/repository/room_view_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/finish_consultation_repo.dart';
import '../../repository/waiting_consultation_repo.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {


  WaitingConsultationRepo waitingConsultationRepo = WaitingConsultationRepo(Crud());
  FinishConsultationRepo finishConsultationRepo = FinishConsultationRepo(Crud());
  RoomViewRepo roomViewRepo = RoomViewRepo(Crud());
  List waitingConsultation = [];
  List finishConsultation = [];
  List roomView = [];

  String? currentType = '1';
  MessageBloc() : super(MessageInitial()) {
    on<MessageEvent>((event, emit) async {

      if(event is ChangeTypeEvent){
        currentType = event.type;
        emit(ChangeTypeState(currentType!));
      }
      else if (event is GetWaitingConsultation){
        dynamic response;
        try{
          emit(LoadingState());
          response = await waitingConsultationRepo.getWaitingConsultation();
          waitingConsultation.clear();
          waitingConsultation.addAll(response[0]);
          emit(GetWaitingConsultationDoneState(waitingConsultation));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if (event is GetRoomViewEvent){
        dynamic response;
        try{
          emit(LoadingState());
          response = await roomViewRepo.getRoomView();
          roomView.clear();
          roomView.addAll(response);
          emit(GetRoomViewDoneState(roomView));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if (event is GetFinishConsultation){
        dynamic response;
        try{
          emit(LoadingState());
          response = await finishConsultationRepo.getFinishConsultation();
          finishConsultation.clear();
          finishConsultation.addAll(response);
          emit(GetFinishConsultationDoneState(finishConsultation));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
    });
  }
}
