part of 'post_question_bloc.dart';

abstract class PostQuestionState extends Equatable {
  const PostQuestionState();
}

class PostQuestionInitial extends PostQuestionState {
  @override
  List<Object> get props => [];
}

class ChangeCategoryState extends PostQuestionState{
  final bool selectedCategory;
  const ChangeCategoryState(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];

}

class PostQuestionLoadingState extends PostQuestionState{

  @override
  List<Object?> get props => [];

}

class ErrorState extends PostQuestionState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class GetPostDoneState extends PostQuestionState{
  final List posts;
  const GetPostDoneState(this.posts);

  @override
  List<Object?> get props => [posts];
}

class GetQuestionDoneState extends PostQuestionState{
  final List questions;
  const GetQuestionDoneState(this.questions);

  @override
  List<Object?> get props => [questions];
}

class AddQuestionDoneState extends PostQuestionState{

  @override
  List<Object?> get props => [];

}

class ChangeSwitchState extends PostQuestionState{
  final bool unKnown;

  const ChangeSwitchState(this.unKnown);
  @override
  List<Object?> get props => [unKnown];

}

class GetSpecializationsDone extends PostQuestionState{
  final List <SpecializationModel> specializationsValue;

  const GetSpecializationsDone(this.specializationsValue);
  @override
  List<Object?> get props =>[specializationsValue];

}

