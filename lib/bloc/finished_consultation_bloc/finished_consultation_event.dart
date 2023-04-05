part of 'finished_consultation_bloc.dart';

abstract class FinishedConsultationEvent extends Equatable {
  const FinishedConsultationEvent();
}


class SendRatingEvent extends FinishedConsultationEvent {
  final int doctorId;
  final String rate;

  const SendRatingEvent(this.doctorId, this.rate);
  @override
  List<Object?> get props => [doctorId,rate];
}
