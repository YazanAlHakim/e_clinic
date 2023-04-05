part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ClickRegisterEvent extends AuthEvent{
  const ClickRegisterEvent();

  @override
  List<Object?> get props => [];
}

class ChangePageAuthEvent extends AuthEvent{
  final int index;

  const ChangePageAuthEvent(this.index);
  @override
  List<Object?> get props => [index];

}

class GetCitiesEvent extends AuthEvent{
  @override
  List<Object?> get props =>[];

}

class LoginEvent extends AuthEvent{
  @override
  List<Object?> get props =>[];

}

class UploadImage extends AuthEvent{
  @override
  List<Object?> get props => [];

}


