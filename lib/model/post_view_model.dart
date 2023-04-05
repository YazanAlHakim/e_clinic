class PostViewModel {
  int? doctorId;
  String? image;
  String? body;
  int? specializationId;
  String? createdAt;
  Doctor? doctor;
  Specialization? specialization;

  PostViewModel(
      {this.doctorId,
        this.image,
        this.body,
        this.specializationId,
        this.createdAt,
        this.doctor,
        this.specialization});

  PostViewModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    image = json['image'];
    body = json['body'];
    specializationId = json['specialization_id'];
    createdAt = json['created_at'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    specialization = json['specialization'] != null
        ? new Specialization.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['image'] = this.image;
    data['body'] = this.body;
    data['specialization_id'] = this.specializationId;
    data['created_at'] = this.createdAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.specialization != null) {
      data['specialization'] = this.specialization!.toJson();
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

class Specialization {
  int? id;
  String? name;

  Specialization({this.id, this.name});

  Specialization.fromJson(Map<String, dynamic> json) {
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
