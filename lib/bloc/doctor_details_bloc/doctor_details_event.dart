part of 'doctor_details_bloc.dart';

abstract class DoctorDetailsEvent extends Equatable {
  const DoctorDetailsEvent();
}

class SendPrivateCompliantEvent extends DoctorDetailsEvent{
  final String doctorId;
  final String body;

  const SendPrivateCompliantEvent(this.doctorId, this.body);
  @override
  List<Object?> get props => [doctorId,body];

}