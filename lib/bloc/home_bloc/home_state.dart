part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState{
  @override
  List<Object?> get props =>[];

}

class ErrorState extends HomeState{
  final String error;
  const ErrorState(this.error);
  @override
  List<Object?> get props =>[error];

}

class GetDataDone extends HomeState{
  final List specializations;
  final List<DistinguishedDoctorsModel> distinguishedDoctors;
  const GetDataDone(this.specializations, this.distinguishedDoctors);

  @override
  List<Object?> get props =>[specializations,distinguishedDoctors];

}
