
import 'package:e_clinic/core/class/crud.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/complaint_store_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  ComplaintStoreRepo complaintStoreRepo = ComplaintStoreRepo(Crud());

  TextEditingController controller = TextEditingController();
  String typeCompliant = '';

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if(event is SendPublicComplaint){
        dynamic response ;
        try{
          emit(LoadingState());
          response = complaintStoreRepo.sendPublicComplaint(
              event.type,
              event.body,
          );
          controller.clear();
          emit(SendPublicCompliantDone());
        }catch(_){

        }
      }
    });
  }
}
