part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class ChangeTypeEvent extends MessageEvent{
  final String type;

  const ChangeTypeEvent(this.type);

  @override
  List<Object?> get props => [type];

}

class GetWaitingConsultation extends MessageEvent{
  @override
  List<Object?> get props => [];

}


class GetFinishConsultation extends MessageEvent{
  @override
  List<Object?> get props => [];

}

class GetRoomViewEvent extends MessageEvent{
  @override
  List<Object?> get props => [];

}


