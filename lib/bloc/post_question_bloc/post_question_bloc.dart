import 'package:e_clinic/core/function/handling_failure.dart';
import 'package:e_clinic/model/specialization_model.dart';
import 'package:e_clinic/repository/question_view_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/class/crud.dart';
import '../../repository/add_question_repo.dart';
import '../../repository/post_view_repo.dart';

part 'post_question_event.dart';
part 'post_question_state.dart';

class PostQuestionBloc extends Bloc<PostQuestionEvent, PostQuestionState> {

  bool selectedCategory = true;
  PostViewRepo postViewRepo = PostViewRepo(Crud());
  AddQuestionRepo addQuestionRepo = AddQuestionRepo(Crud());
  QuestionViewRepo questionViewRepo = QuestionViewRepo(Crud());
  List posts = [];
  List questions = [];

  List specializations =[];
  List <SpecializationModel> specializationsValue  = [];

  String? selectedSpecializationId;

  bool unknown = false;

  TextEditingController question = TextEditingController();

  PostQuestionBloc() : super(PostQuestionInitial()) {
    on<PostQuestionEvent>((event, emit) async {

      if(event is ChangeCategoryEvent){
        selectedCategory = event.selectedCategory;
        emit(ChangeCategoryState(selectedCategory));
      }
      else if (event is GetPostsEvent){
        dynamic response;
        try{
          emit(PostQuestionLoadingState());
          response = await postViewRepo.getPosts();
          posts.clear();
          posts.addAll(response);
          emit(GetPostDoneState(posts));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if(event is GetQuestionEvent){
        dynamic response;
        try{
          emit(PostQuestionLoadingState());
          response = await questionViewRepo.getQuestions();
          questions.clear();
          questions.addAll(response);
          emit(GetQuestionDoneState(questions));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }
      else if(event is AddQuestionEvent){
        dynamic response;
        try{
          emit(PostQuestionLoadingState());
          response = await addQuestionRepo.addQuestion(
              question.text,
              selectedSpecializationId!,
              unknown,
          );
          question.clear();
          emit(AddQuestionDoneState());
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }

      else if (event is ChangeSwitchEvent){
        unknown = event.unKnown;
        emit(ChangeSwitchState(unknown));
      }
      else if (event is GetSpecializationEvent){
        dynamic response;
        try{
          emit(PostQuestionLoadingState());
          response = await addQuestionRepo.specializationView();
          specializations.clear();
          specializations.addAll(response);
          specializationsValue = specializations.map((item) => SpecializationModel.fromJson(item)).toList();
          emit(GetSpecializationsDone(specializationsValue));
        }catch(_){
          emit(ErrorState(handlingFailure(response)));
        }
      }

    });
  }
}
