part of 'medication_bloc.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();
}

class MedicationInitial extends MedicationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MedicationState{
  @override
  List<Object?> get props =>[];
}

class GetMedicationDone extends MedicationState{
  final List medication;
  const GetMedicationDone(this.medication);

  @override
  List<Object?> get props => [medication];
}

class ErrorState extends MedicationState{
  final String error;
  const ErrorState(this.error);

  @override
  List<Object?> get props =>[];

}
