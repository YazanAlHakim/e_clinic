part of 'doctor_bloc.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();
}

class GetDoctorEvent extends DoctorEvent{
  @override
  List<Object?> get props => [];

}

class GetFilterDoctor extends DoctorEvent{
  final String specializationId;
  final int index;
  const GetFilterDoctor(this.specializationId, this.index);

  @override
  List<Object?> get props => [specializationId,index];

}



