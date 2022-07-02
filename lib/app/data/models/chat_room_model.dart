import 'package:customer_app/app/data/models/chat_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';

class RoomChatModel {
  int? id;
  UserModel? senderId;
  UserModel? receiverId;
  ChatModel? chat;
  int? isHide;

  RoomChatModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.chat,
    this.isHide,
  });

  RoomChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'] != null
        ? UserModel.fromJson(json['sender_id'])
        : null;
    receiverId = json['receiver_id'] != null
        ? UserModel.fromJson(json['receiver_id'])
        : null;
    chat = json['chat_id'];
    isHide = json['is_hide'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (senderId != null) {
      data['sender_id'] = senderId!.toJson();
    }
    if (receiverId != null) {
      data['receiver_id'] = senderId!.toJson();
    }
    data['chat_id'] = chat;
    data['is_hide'] = isHide;
    return data;
  }
}
