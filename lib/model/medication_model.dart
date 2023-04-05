class MedicationModel {
  int? id;
  String? name;
  String? dose;
  String? duration;
  String? notes;
  int? consultationId;
  int? doctorId;
  int? patientId;
  String? createdAt;
  String? updatedAt;
  Doctor? doctor;
  Consultation? consultation;

  MedicationModel(
      {this.id,
        this.name,
        this.dose,
        this.duration,
        this.notes,
        this.consultationId,
        this.doctorId,
        this.patientId,
        this.createdAt,
        this.updatedAt,
        this.doctor,
        this.consultation});

  MedicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dose = json['dose'];
    duration = json['duration'];
    notes = json['notes'];
    consultationId = json['consultation_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    consultation = json['consultation'] != null
        ? new Consultation.fromJson(json['consultation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dose'] = this.dose;
    data['duration'] = this.duration;
    data['notes'] = this.notes;
    data['consultation_id'] = this.consultationId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.consultation != null) {
      data['consultation'] = this.consultation!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? name;

  Doctor({this.id, this.name});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Consultation {
  int? id;
  String? title;

  Consultation({this.id, this.title});

  Consultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
