part of 'message_room_bloc.dart';

abstract class MessageRoomEvent extends Equatable {
  const MessageRoomEvent();
}

class GetMessageViewEvent extends MessageRoomEvent{
  final String roomId;
  const GetMessageViewEvent(this.roomId);

  @override
  List<Object?> get props => [roomId];

}

class SendMessageEvent extends MessageRoomEvent{
  final String roomId;
  const SendMessageEvent(this.roomId);

  @override
  List<Object?> get props => [roomId];

}
