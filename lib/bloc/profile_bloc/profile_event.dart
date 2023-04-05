part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class SendPublicComplaint extends ProfileEvent{
  final String type;
  final String body;

  const SendPublicComplaint(this.type, this.body);
  @override
  List<Object?> get props => [type,body];

}
