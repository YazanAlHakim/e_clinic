part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();
}

class DoctorInitial extends DoctorState {
  @override
  List<Object> get props => [];
}

class GetDoctorDone extends DoctorState{
  final List doctors;
  const GetDoctorDone(this.doctors);

  @override
  List<Object?> get props => [];
}

class GetFilterDoctorDone extends DoctorState{
  final List doctors;
  const GetFilterDoctorDone(this.doctors);

  @override
  List<Object?> get props => [];
}

class LoadingState extends DoctorState{
  @override
  List<Object?> get props => [];
}

class ErrorState extends DoctorState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props => [];
}


