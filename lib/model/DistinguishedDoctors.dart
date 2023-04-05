class DistinguishedDoctorsModel {
  String? name;
  int? sex;
  String? image;
  int? numConsulting;
  String? openingTime;
  int? numPost;
  int? rate;
  int? specializationId;
  String? fullAddress;
  Specialization? specialization;

  DistinguishedDoctorsModel(
      {this.name,
        this.sex,
        this.image,
        this.numConsulting,
        this.openingTime,
        this.numPost,
        this.rate,
        this.specializationId,
        this.fullAddress,
        this.specialization});

  DistinguishedDoctorsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    image = json['image'];
    numConsulting = json['num_consulting'];
    openingTime = json['opening_time'];
    numPost = json['num_post'];
    rate = json['rate'];
    specializationId = json['specialization_id'];
    fullAddress = json['full_address'];
    specialization = json['specialization'] != null
        ? new Specialization.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['image'] = this.image;
    data['num_consulting'] = this.numConsulting;
    data['opening_time'] = this.openingTime;
    data['num_post'] = this.numPost;
    data['rate'] = this.rate;
    data['specialization_id'] = this.specializationId;
    data['full_address'] = this.fullAddress;
    if (this.specialization != null) {
      data['specialization'] = this.specialization!.toJson();
    }
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
