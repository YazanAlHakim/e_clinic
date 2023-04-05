import 'package:e_clinic/core/class/crud.dart';
import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../repository/register_repo.dart';
part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {


  RegisterRepo registerRepo = RegisterRepo(Crud());

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController permanentMedicineText = TextEditingController();
  TextEditingController surgeryText = TextEditingController();
  TextEditingController geneticDiseasesText = TextEditingController();
  TextEditingController sensitiveText = TextEditingController();
  TextEditingController vaccinesText = TextEditingController();
  TextEditingController otherWiseText = TextEditingController();

  bool permanentMedicine = false;
  bool surgery = false;
  bool highBloodPressure = false;
  bool diabetes = false;
  bool geneticDiseases = false;
  bool vaccines = false;
  bool sensitive = false;
  bool gender = false;
  bool married = false;
  bool smoking = false;
  bool bubbly = false;
  bool alcohol = false;
  bool stimulant = false;
  bool otherWise = false;





  PatientBloc() : super(PatientFormInitial()) {

    on<PatientEvent>((event, emit) async {
      if(event is PermanentMedicineEvent){
        permanentMedicine = event.permanentMedicine;
        emit(PermanentMedicineState(permanentMedicine));
      }
      else if (event is SurgeryEvent){
        surgery = event.surgery;
        emit(SurgeryState(surgery));
      }
      else if (event is HighBloodPressureEvent){
        highBloodPressure = event.highBloodPressure;
        emit(HighBloodPressureState(highBloodPressure));
      }
      else if(event is DiabetesEvent){
        diabetes = event.diabetes;
        emit(DiabetesState(diabetes));
      }
      else if (event is GeneticDiseasesEvent){
        geneticDiseases = event.geneticDiseases;
        emit(GeneticDiseasesState(geneticDiseases));
      }
      else if(event is VaccinesEvent){
        vaccines = event.vaccines;
        emit(VaccinesState(vaccines));
      }
      else if(event is SensitiveEvent){
        sensitive = event.sensitive;
        emit(SensitiveState(sensitive));
      }
      else if(event is GenderEvent){
        gender = event.gender;
        emit(GenderState(gender));
      }
      else if(event is MarriedEvent){
        married = event.married;
        emit(MarriedState(married));
      }
      else if(event is SmokingEvent){
        smoking = event.smoking;
        emit(SmokingState(smoking));
      }
      else if (event is BubblyEvent){
        bubbly = event.bubbly;
        emit(BubblyState(bubbly));
      }
      else if(event is AlcoholEvent){
        alcohol = event.alcohol;
        emit(AlcoholState(alcohol));
      }
      else if(event is StimulantEvent){
        stimulant = event.stimulant;
        emit(StimulantState(stimulant));
      }
      else if (event is OtherWiseEvent){
        otherWise = event.otherWise;
        emit(OtherWiseState(otherWise));
      }
      else if (event is RegisterEvent){
        dynamic response;
        emit(LoadingState());
        try{
          response = await registerRepo.register(
              name.text,
              event.email,
              event.password,
              event.cityId,
              phone.text,
              age.text,
              height.text,
              weight.text,
              gender,
              married,
              address.text,
              otherWiseText.text,
              permanentMedicine ? permanentMedicineText.text : 'لا يوجد',
              surgery ? surgeryText.text : 'لا يوجد',
              highBloodPressure,
              diabetes,
              geneticDiseases ? geneticDiseasesText.text : 'لا يوجد',
              vaccines ? vaccinesText.text : 'لا يوجد',
              sensitive ? sensitiveText.text : 'لا يوجد',
              prefs.getString('fireBaseToken')!,
          );
          await prefs.setString('token', response['token']);
          await prefs.setInt('id', response['patient']['id']);
          await prefs.setString('name', response['patient']['name']);
          await prefs.setString('image', response['patient']['image']);
          await prefs.setBool('login', true);
          emit(RegisterFormDoneState());
        }catch(_){
          emit(RegisterFormErrorState(handlingFailure(response)));
        }
      }
    }


    );
  }
}
