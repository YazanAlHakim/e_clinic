part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ProfileState{
  @override
  List<Object?> get props => [];

}

class SendPublicCompliantDone extends ProfileState{
  @override
  List<Object?> get props => [];

}
