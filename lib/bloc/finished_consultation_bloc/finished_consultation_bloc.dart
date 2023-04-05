
import 'package:e_clinic/core/class/crud.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/send_rate_repo.dart';

part 'finished_consultation_event.dart';
part 'finished_consultation_state.dart';

class FinishedConsultationBloc extends Bloc<FinishedConsultationEvent, FinishedConsultationState> {

  SendRateRepo sendRateRepo = SendRateRepo(Crud());

  String? rating;
  FinishedConsultationBloc() : super(FinishedConsultationInitial()) {
    on<FinishedConsultationEvent>((event, emit) {
      if(event is SendRatingEvent){
        dynamic response;

        try{
          emit(LoadingState());
          var response = sendRateRepo.sendRate(
          event.doctorId.toString(),
            event.rate.toString(),
          );
          emit(SendRateDoneState());
        }catch(_){
          //emit(LoginErrorState(handlingFailure(response)));
        }
      }
    });
  }
}
