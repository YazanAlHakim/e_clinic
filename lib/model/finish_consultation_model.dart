class FinishConsultationModel {
  int? id;
  String? title;
  int? doctorId;
  String? details;
  String? createdAt;
  bool? medications;
  Doctor? doctor;
  String? notes;
  List<Null>? medication;

  FinishConsultationModel(
      {this.id,
        this.title,
        this.doctorId,
        this.details,
        this.createdAt,
        this.medications,
        this.doctor,
        this.notes,
        this.medication});

  FinishConsultationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    doctorId = json['doctor_id'];
    details = json['details'];
    createdAt = json['created_at'];
    medications = json['medications'];
    notes = json['notes'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    if (json['medication'] != null) {
      medication = <Null>[];
      json['medication'].forEach((v) {
        //medication!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['doctor_id'] = this.doctorId;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['medications'] = this.medications;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.medication != null) {
      //data['medication'] = this.medication!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  String? image;

  Doctor({this.id, this.name, this.image});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
