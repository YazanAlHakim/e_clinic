import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/class/crud.dart';
import '../../repository/medication_repo.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {

  List medications =[];
  MedicationRepo medicationRepo = MedicationRepo(Crud());
  MedicationBloc() : super(MedicationInitial()) {
    on<MedicationEvent>((event, emit) async {
      if(event is GetMedicationEvent){
        dynamic response;
        try{
          emit(LoadingState());
          response = await medicationRepo.getMedication();
          medications.clear();
          medications.addAll(response);
          emit(GetMedicationDone(medications));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
    });
  }
}
