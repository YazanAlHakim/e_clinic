class RoomViewModel {
  int? id;
  int? consultationId;
  int? doctorId;
  String? createdAt;
  Doctor? doctor;
  Consultation? consultation;

  RoomViewModel(
      {this.id,
        this.consultationId,
        this.doctorId,
        this.createdAt,
        this.doctor,
        this.consultation});

  RoomViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    doctorId = json['doctor_id'];
    createdAt = json['created_at'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    consultation = json['consultation'] != null
        ? new Consultation.fromJson(json['consultation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultation_id'] = this.consultationId;
    data['doctor_id'] = this.doctorId;
    data['created_at'] = this.createdAt;
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
