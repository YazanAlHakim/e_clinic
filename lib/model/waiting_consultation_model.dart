class WaitingConsultationModel {
  String? title;
  String? createdAt;

  WaitingConsultationModel({this.title, this.createdAt});

  WaitingConsultationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    return data;
  }
}
