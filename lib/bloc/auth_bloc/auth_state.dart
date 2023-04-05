part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class GoToSignUp extends AuthState{
  final int currentIndex;

  const GoToSignUp (this.currentIndex);
  @override
  List<Object?> get props => [currentIndex];
}

class ChangePageState extends AuthState{
  final int currentIndex;

  const ChangePageState (this.currentIndex);
  @override
  List<Object?> get props => [currentIndex];
}

class CitiesSuccessState extends AuthState{
  final List <CitiesModel> citiesValues;
  const CitiesSuccessState(this.citiesValues);

  @override
  List<Object?> get props =>[citiesValues];

}

class CitiesErrorState extends AuthState{
  final String error;
  const CitiesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadingState extends AuthState{

  @override
  List<Object?> get props => [];

}

class LoginDoneState extends AuthState{
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends AuthState{
  final String error;
  const LoginErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class RegisterErrorState extends AuthState{
  final String error;
  const RegisterErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


