import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class ChatProvider extends GetConnect {
  @override
  String url = baseUrl + "chat";

  Future<dynamic> getData(String token) async {
    final response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(
      int? senderId, int? receiverId, String? text, String? token) async {
    final response = await post('$url', {
      "sender_id": senderId.toString(),
      "receiver_id": receiverId.toString(),
      "text": text,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
