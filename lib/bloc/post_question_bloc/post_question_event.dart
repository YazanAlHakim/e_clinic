part of 'post_question_bloc.dart';

abstract class PostQuestionEvent extends Equatable {
  const PostQuestionEvent();
}

class ChangeCategoryEvent extends PostQuestionEvent{

  final bool selectedCategory;
  const ChangeCategoryEvent(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];
}

class GetPostsEvent extends PostQuestionEvent{
  @override
  List<Object?> get props => [];

}

class GetQuestionEvent extends PostQuestionEvent{
  @override
  List<Object?> get props => [];

}

class AddQuestionEvent extends PostQuestionEvent{

  @override
  List<Object?> get props => [];

}

class ChangeSwitchEvent extends PostQuestionEvent{
  final bool unKnown;

  const ChangeSwitchEvent(this.unKnown);
  @override
  List<Object?> get props => [unKnown];

}

class GetSpecializationEvent extends PostQuestionEvent{
  @override
  List<Object?> get props => [];

}

