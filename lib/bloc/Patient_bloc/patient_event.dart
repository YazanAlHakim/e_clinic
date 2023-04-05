part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();
}

class PermanentMedicineEvent extends PatientEvent{
  final bool permanentMedicine;
  const PermanentMedicineEvent(this.permanentMedicine);

  @override
  List<Object?> get props => [permanentMedicine];

}
class SurgeryEvent extends PatientEvent{
  final bool surgery;
  const SurgeryEvent(this.surgery);

  @override
  List<Object?> get props => [surgery];

}

class HighBloodPressureEvent extends PatientEvent{
  final bool highBloodPressure;
  const HighBloodPressureEvent(this.highBloodPressure);

  @override
  List<Object?> get props => [highBloodPressure];
}

class DiabetesEvent extends PatientEvent{
  final bool diabetes;
  const DiabetesEvent(this.diabetes);

  @override
  List<Object?> get props => [diabetes];

}

class GeneticDiseasesEvent extends PatientEvent{
  final bool geneticDiseases ;
  const GeneticDiseasesEvent(this.geneticDiseases);

  @override
  List<Object?> get props => [geneticDiseases];
}

class VaccinesEvent extends PatientEvent{
  final bool vaccines;
  const VaccinesEvent(this.vaccines);

  @override
  List<Object?> get props => [vaccines];
}

class SensitiveEvent extends PatientEvent{
  final bool sensitive;
  const SensitiveEvent(this.sensitive);

  @override
  List<Object?> get props => [sensitive];
}

class GenderEvent extends PatientEvent{
  final bool gender;
  const GenderEvent(this.gender);

  @override
  List<Object?> get props => [gender];
}

class MarriedEvent extends PatientEvent{
  final bool married;
  const MarriedEvent(this.married);

  @override
  List<Object?> get props => [married];

}

class SmokingEvent extends PatientEvent{
  final bool smoking;
  const SmokingEvent(this.smoking);

  @override
  List<Object?> get props => [smoking];

}

class BubblyEvent extends PatientEvent{
  final bool bubbly;
  const BubblyEvent(this.bubbly);

  @override
  List<Object?> get props => [bubbly];

}

class AlcoholEvent extends PatientEvent{
  final bool alcohol;
  const AlcoholEvent(this.alcohol);

  @override
  List<Object?> get props =>[alcohol];

}

class StimulantEvent extends PatientEvent{
  final bool stimulant;
  const StimulantEvent(this.stimulant);

  @override
  List<Object?> get props => [stimulant];

}

class OtherWiseEvent extends PatientEvent{
  final bool otherWise;
  const OtherWiseEvent(this.otherWise);

  @override
  List<Object?> get props => [otherWise];
}

class RegisterEvent extends PatientEvent{
  final String email;
  final String password;
  final String cityId;

  const RegisterEvent(this.email,this.password, this.cityId,);
  @override
  List<Object?> get props => [email,password,cityId];

}

