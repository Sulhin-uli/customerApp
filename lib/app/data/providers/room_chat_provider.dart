import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class RoomChatProvider extends GetConnect {
  @override
  String url = baseUrl + "room-chat";

  Future<dynamic> getData(String token) async {
    final response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(
      int? senderId, int? receiverId, int? chatId, String? token) async {
    final response = await post('$url', {
      "sender_id": senderId,
      "receiver_id": receiverId,
      "chat_id": chatId,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}
