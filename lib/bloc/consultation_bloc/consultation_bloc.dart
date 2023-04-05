
import 'dart:io';

import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/class/crud.dart';
import '../../repository/send_consultation_repo.dart';

part 'consultation_event.dart';
part 'consultation_state.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {


  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? image;

  SendConsultationRepo sendConsultationRepo =SendConsultationRepo(Crud());

  String? type;
  String? update;
  String?frequency;
  String?severityPain;
  String?naturePain;
  TextEditingController consultationTitleText = TextEditingController();
  TextEditingController consultationDetailsText = TextEditingController();
  TextEditingController consultationTimeText = TextEditingController();
  TextEditingController consultationFactorsIncreaseText = TextEditingController();
  TextEditingController consultationFactorsReduceText = TextEditingController();
  TextEditingController consultationPlaceText = TextEditingController();




  ConsultationBloc() : super(ConsultationInitial()) {
    on<ConsultationEvent>((event, emit) async {
      if(event is ChangeTypeEvent){
        type = event.type;
        print('$type typeeeee');
        emit(ChangeTypeState(type!));
      }
      else if(event is ChangeUpdateEvent){
        update = event.update;
        print('$update updateee');
        emit(ChangeUpdateState(update!));
      }
      else if(event is ChangeFrequencyEvent){
        frequency = event.frequency;
        print('$frequency frequency');
        emit(ChangeFrequencyState(frequency!));
      }
      else if(event is ChangeSeverityPainEvent){
        severityPain = event.severityPain;
        print('$severityPain severityPain');
        emit(ChangeSeverityPainState(severityPain!));
      }
      else if(event is ChangeNaturePainEvent){
        naturePain = event.naturePain;
        print('$naturePain naturePain');
        emit(ChangeSeverityPainState(naturePain!));
      }
      else if (event is SendConsultationEvent){
        dynamic response;
        try{
          emit(LoadingState());
          response = await sendConsultationRepo.sendConsultation(
              consultationTitleText.text,
              type!,
              consultationDetailsText.text,
              consultationTimeText.text,
              update!,
              frequency!,
              severityPain!,
              consultationFactorsIncreaseText.text,
              consultationFactorsReduceText.text,
              consultationPlaceText.text,
              //images,
              naturePain!,
              event.doctorId,
              event.specializationId,
          );
          emit(SendConsultationDoneState());
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }

      else if (event is UploadImage){
        var pickedImage = await imagePicker.pickMultiImage();
        image = pickedImage ;
        emit(UploadImageState(image!));
      }

    });
  }
}
