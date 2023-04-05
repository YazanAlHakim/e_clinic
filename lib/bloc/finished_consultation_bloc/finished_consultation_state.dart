part of 'finished_consultation_bloc.dart';

abstract class FinishedConsultationState extends Equatable {
  const FinishedConsultationState();
}

class FinishedConsultationInitial extends FinishedConsultationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends FinishedConsultationState{
  @override
  List<Object?> get props =>[];

}

class SendRateDoneState extends FinishedConsultationState{
  @override
  List<Object?> get props => [];

}
