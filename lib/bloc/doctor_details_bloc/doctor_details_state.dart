part of 'doctor_details_bloc.dart';

abstract class DoctorDetailsState extends Equatable {
  const DoctorDetailsState();
}

class DoctorDetailsInitial extends DoctorDetailsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DoctorDetailsState{
  @override
  List<Object?> get props => [];
}

class SendPrivateCompliantDone extends DoctorDetailsState{
  @override
  List<Object?> get props => [];

}
