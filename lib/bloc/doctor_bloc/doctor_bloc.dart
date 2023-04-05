import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:e_clinic/repository/doctors_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/complaint_store_repo.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {

  List doctors = [];
  DoctorRepo doctorRepo =DoctorRepo(Crud());

  int? selected;



  DoctorBloc() : super(DoctorInitial()) {
    on<DoctorEvent>((event, emit) async {
      if (event is GetDoctorEvent){
        dynamic response;
        emit(LoadingState());
        try{
          response = await doctorRepo.getDoctor();
          doctors.clear();
          doctors.addAll(response);
          emit(GetDoctorDone(doctors));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if (event is GetFilterDoctor){
        selected = event.index;
        dynamic response;
        emit(LoadingState());
        try{ print('hereeeee2');
          response = await doctorRepo.getFilterDoctor(event.specializationId);
          doctors.clear();
          print('hereeeee');
          doctors.addAll(response);
          emit(GetDoctorDone(doctors));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }


    });
  }
}
