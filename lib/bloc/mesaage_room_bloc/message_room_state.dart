part of 'message_room_bloc.dart';

abstract class MessageRoomState extends Equatable {
  const MessageRoomState();
}

class MessageRoomInitial extends MessageRoomState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MessageRoomState{
  @override
  List<Object?> get props => [];

}

class ErrorState extends MessageRoomState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class GetMessagesDone extends MessageRoomState{

  final List messages;
  const GetMessagesDone(this.messages);

  @override
  List<Object?> get props =>[messages];


}

class SendMessageDone extends MessageRoomState{
  @override
  List<Object?> get props => [];

}
