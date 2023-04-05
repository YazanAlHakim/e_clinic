class QuestionViewModel {
  int? id;
  String? body;
  int? specializationId;
  int? answered;
  int? anonymous;
  int? patientId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? image;
  int? specializationsId;
  String? specializationsName;
  int? repliesId;
  String? repliesBody;
  String? repliesCreatedAt;
  int? doctorId;
  String? doctorName;
  String? doctorImage;

  QuestionViewModel(
      {this.id,
        this.body,
        this.specializationId,
        this.answered,
        this.anonymous,
        this.patientId,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.image,
        this.specializationsId,
        this.specializationsName,
        this.repliesId,
        this.repliesBody,
        this.repliesCreatedAt,
        this.doctorId,
        this.doctorName,
        this.doctorImage});

  QuestionViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    specializationId = json['specialization_id'];
    answered = json['answered'];
    anonymous = json['anonymous'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    image = json['image'];
    specializationsId = json['specializations_id'];
    specializationsName = json['specializations_name'];
    repliesId = json['replies_id'];
    repliesBody = json['replies_body'];
    repliesCreatedAt = json['replies_created_at'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorImage = json['doctor_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['specialization_id'] = this.specializationId;
    data['answered'] = this.answered;
    data['anonymous'] = this.anonymous;
    data['patient_id'] = this.patientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['image'] = this.image;
    data['specializations_id'] = this.specializationsId;
    data['specializations_name'] = this.specializationsName;
    data['replies_id'] = this.repliesId;
    data['replies_body'] = this.repliesBody;
    data['replies_created_at'] = this.repliesCreatedAt;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['doctor_image'] = this.doctorImage;
    return data;
  }
}
