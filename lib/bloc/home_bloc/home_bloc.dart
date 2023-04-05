import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:e_clinic/repository/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/DistinguishedDoctors.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeRepo homeRepo = HomeRepo(Crud());
  List specializations = [];
  List distinguishedDoctors = [];
  List <DistinguishedDoctorsModel>distinguishedDoctorsValue =[];

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {

      if(event is GetDateEvent){
        dynamic response;
        try{
          emit(LoadingState());
          response = await homeRepo.getSpecializationsAndDoctor();
          specializations.addAll(response['Specializations']);
          distinguishedDoctors.addAll(response['Distinguished_Doctors']);
          distinguishedDoctorsValue = distinguishedDoctors.map((item) => DistinguishedDoctorsModel.fromJson(item)).toList();
          emit(GetDataDone(specializations,distinguishedDoctorsValue));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
    });
  }
}
