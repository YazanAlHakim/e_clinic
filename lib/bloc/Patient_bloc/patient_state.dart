part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();
}

class PatientFormInitial extends PatientState {
  @override
  List<Object> get props => [];
}

class PermanentMedicineState extends PatientState{

  final bool permanentMedicine;
  const PermanentMedicineState(this.permanentMedicine);

  @override
  List<Object?> get props => [permanentMedicine];

}

class SurgeryState extends PatientState{
  final bool surgery;
  const SurgeryState(this.surgery);

  @override
  List<Object?> get props =>[surgery];

}

class HighBloodPressureState extends PatientState{
  final bool highBloodPressure;
  const HighBloodPressureState(this.highBloodPressure);

  @override

  List<Object?> get props => [highBloodPressure];
}

class DiabetesState extends PatientState{
  final bool diabetes;
  const DiabetesState(this.diabetes);

  @override
  List<Object?> get props => [diabetes];
}

class GeneticDiseasesState extends PatientState{
  final bool geneticDiseases ;
  const GeneticDiseasesState(this.geneticDiseases);

  @override
  List<Object?> get props => [geneticDiseases];
}

class VaccinesState extends PatientState{
  final bool vaccines;
  const VaccinesState(this.vaccines);

  @override
  List<Object?> get props =>[vaccines];

}

class SensitiveState extends PatientState{
  final bool sensitive;
  const SensitiveState(this.sensitive);

  @override
  List<Object?> get props => [sensitive];
}

class GenderState extends PatientState{
  final bool gender;
  const GenderState(this.gender);

  @override
  List<Object?> get props => [gender];
}

class MarriedState extends PatientState{
  final bool married;
  const MarriedState(this.married);

  @override
  List<Object?> get props => [married];

}

class SmokingState extends PatientState{
  final bool smoking;
  const SmokingState(this.smoking);

  @override
  List<Object?> get props => [smoking];

}

class BubblyState extends PatientState{
  final bool bubbly;
  const BubblyState(this.bubbly);

  @override
  List<Object?> get props => [bubbly];

}

class AlcoholState extends PatientState{
  final bool alcohol;
  const AlcoholState(this.alcohol);

  @override
  List<Object?> get props =>[alcohol];
}

class StimulantState extends PatientState{
  final bool stimulant;
  const StimulantState(this.stimulant);

  @override
  List<Object?> get props => [stimulant];

}

class OtherWiseState extends PatientState{
  final bool otherWise;
  const OtherWiseState(this.otherWise);

  @override
  List<Object?> get props => [otherWise];

}

class LoadingState extends PatientState{
  @override
  List<Object?> get props => [];

}

class RegisterFormDoneState extends PatientState{
  @override
  List<Object?> get props => [];

}

class RegisterFormErrorState extends PatientState{
   final String error;

  const RegisterFormErrorState(this.error);

  @override
  List<Object?> get props => [error];

}
