class DoctorModel {
  int? id;
  String? name;
  String? mobileNumber;
  String? clinicNumber;
  int? sex;
  String? image;
  int? numConsulting;
  String? mainTitle;
  String? title;
  String? openingTime;
  int? numPost;
  int? rate;
  int? specializationId;
  String? fullAddress;
  double? lon;
  double? lat;
  int? cityId;
  Specialization? specialization;
  Specialization? city;

  DoctorModel(
      {this.id,
        this.name,
        this.mobileNumber,
        this.clinicNumber,
        this.sex,
        this.image,
        this.numConsulting,
        this.mainTitle,
        this.title,
        this.openingTime,
        this.numPost,
        this.rate,
        this.specializationId,
        this.fullAddress,
        this.lon,
        this.lat,
        this.cityId,
        this.specialization,
        this.city});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    clinicNumber = json['clinic_number'];
    sex = json['sex'];
    image = json['image'];
    numConsulting = json['num_consulting'];
    mainTitle = json['main_title'];
    title = json['title'];
    openingTime = json['opening_time'];
    numPost = json['num_post'];
    rate = json['rate'];
    specializationId = json['specialization_id'];
    fullAddress = json['full_address'];
    lon = json['lon'];
    lat = json['lat'];
    cityId = json['city_id'];
    specialization = json['specialization'] != null
        ? new Specialization.fromJson(json['specialization'])
        : null;
    city =
    json['city'] != null ? new Specialization.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    data['clinic_number'] = this.clinicNumber;
    data['sex'] = this.sex;
    data['image'] = this.image;
    data['num_consulting'] = this.numConsulting;
    data['main_title'] = this.mainTitle;
    data['title'] = this.title;
    data['opening_time'] = this.openingTime;
    data['num_post'] = this.numPost;
    data['rate'] = this.rate;
    data['specialization_id'] = this.specializationId;
    data['full_address'] = this.fullAddress;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['city_id'] = this.cityId;
    if (this.specialization != null) {
      data['specialization'] = this.specialization!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
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
