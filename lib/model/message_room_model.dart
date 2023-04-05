class MessageRoomModel {
  int? id;
  String? body;
  int? roomId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  MessageRoomModel(
      {this.id,
        this.body,
        this.roomId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  MessageRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    roomId = json['room_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['room_id'] = this.roomId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
