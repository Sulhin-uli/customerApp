import 'package:customer_app/app/data/models/user_model.dart';

class ChatModel {
  int? id;
  UserModel? senderId;
  UserModel? receiverId;
  int? isHide;
  int? isRead;
  String? text;
  String? createdAt;
  String? updatedAt;

  ChatModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.isHide,
    this.isRead,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    isHide = json['is_hide'];
    isRead = json['is_read'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['is_hide'] = isHide;
    data['is_read'] = isRead;
    data['text'] = text;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}
