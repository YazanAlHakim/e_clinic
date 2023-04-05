part of 'consultation_bloc.dart';

abstract class ConsultationEvent extends Equatable {
  const ConsultationEvent();
}

class ChangeTypeEvent extends ConsultationEvent{
  final String type;
  const ChangeTypeEvent(this.type);

  @override
  List<Object?> get props => [type];

}

class ChangeUpdateEvent extends ConsultationEvent{
  final String update;
  const ChangeUpdateEvent(this.update);

  @override
  List<Object?> get props => [update];

}

class ChangeFrequencyEvent extends ConsultationEvent{
  final String frequency;
  const ChangeFrequencyEvent(this.frequency);

  @override
  List<Object?> get props => [frequency];

}

class ChangeSeverityPainEvent extends ConsultationEvent{
  final String severityPain;
  const ChangeSeverityPainEvent(this.severityPain);

  @override
  List<Object?> get props => [severityPain];

}

class ChangeNaturePainEvent extends ConsultationEvent{
  final String naturePain;
  const ChangeNaturePainEvent(this.naturePain);

  @override
  List<Object?> get props => [naturePain];

}

class SendConsultationEvent extends ConsultationEvent{
  final String? doctorId;
  final String specializationId;

  const SendConsultationEvent(this.doctorId, this.specializationId);

  @override
  List<Object?> get props =>[doctorId,specializationId];

}

class UploadImage extends ConsultationEvent{
  @override
  List<Object?> get props => [];

}


