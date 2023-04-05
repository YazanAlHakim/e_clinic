part of 'medication_bloc.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();
}

class GetMedicationEvent extends MedicationEvent{
  @override
  List<Object?> get props => [];

}
