part of 'consultation_bloc.dart';

abstract class ConsultationState extends Equatable {
  const ConsultationState();
}

class ConsultationInitial extends ConsultationState {
  @override
  List<Object> get props => [];
}

class ChangeTypeState extends ConsultationState{
  final String type;
  const ChangeTypeState(this.type);

  @override
  List<Object?> get props => [type];
}

class ChangeUpdateState extends ConsultationState{
  final String update;
  const ChangeUpdateState(this.update);

  @override
  List<Object?> get props => [update];
}

class ChangeFrequencyState extends ConsultationState{
  final String frequency;
  const ChangeFrequencyState(this.frequency);

  @override
  List<Object?> get props => [frequency];
}

class ChangeSeverityPainState extends ConsultationState{
  final String severityPain;
  const ChangeSeverityPainState(this.severityPain);

  @override
  List<Object?> get props => [severityPain];
}

class ChangeNaturePainState extends ConsultationState{
  final String naturePain;
  const ChangeNaturePainState(this.naturePain);

  @override
  List<Object?> get props => [naturePain];
}

class LoadingState extends ConsultationState{
  @override
  List<Object?> get props => [];
}

class SendConsultationDoneState extends ConsultationState{
  @override
  List<Object?> get props => [];
}

class  ErrorState extends ConsultationState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class UploadImageState extends ConsultationState{
  final List<XFile> image;
  const UploadImageState(this.image);

  @override
  List<Object?> get props =>[image];

}

