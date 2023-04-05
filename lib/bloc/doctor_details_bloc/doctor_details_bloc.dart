
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/class/crud.dart';
import '../../repository/complaint_store_repo.dart';

part 'doctor_details_event.dart';
part 'doctor_details_state.dart';

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {

  ComplaintStoreRepo complaintStoreRepo = ComplaintStoreRepo(Crud());
  TextEditingController controller = TextEditingController();

  DoctorDetailsBloc() : super(DoctorDetailsInitial()) {
    on<DoctorDetailsEvent>((event, emit) {
      if(event is SendPrivateCompliantEvent){
      dynamic response ;
      try{
      emit(LoadingState());
      response = complaintStoreRepo.sendPrivateComplaint(
      event.body,
      event.doctorId,
      );
      emit(SendPrivateCompliantDone());
      }catch(_){

      }
      }
    });
  }
}
