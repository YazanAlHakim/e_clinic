part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}

class ChangeTypeState extends MessageState{
  final String type;
  const ChangeTypeState(this.type);

  @override
  List<Object?> get props => [type];

}

class LoadingState extends MessageState{

  @override
  List<Object?> get props => [];

}

class  ErrorState extends MessageState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class GetWaitingConsultationDoneState extends MessageState{
  final List waitingConsultation;
  const GetWaitingConsultationDoneState(this.waitingConsultation);

  @override
  List<Object?> get props => [waitingConsultation];

}

class GetFinishConsultationDoneState extends MessageState {
  final List finishConsultation;

  const GetFinishConsultationDoneState(this.finishConsultation);

  @override
  List<Object?> get props => [finishConsultation];
}

class GetRoomViewDoneState extends MessageState {
  final List roomView;
  const GetRoomViewDoneState(this.roomView);

  @override
  List<Object?> get props => [roomView];
}


