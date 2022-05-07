import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class CartProvider extends GetConnect {
  @override
  String url = baseUrl + "cart";

  Future<dynamic> getData(int userId, String token) async {
    final response = await get('$url/user_id/$userId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(int? userId, int? productId, int? productQty,
      int? sessionId, String? token) async {
    final response = await post('$url', {
      "user_id": userId,
      "product_id": productId,
      "product_qty": productQty,
      "session_id": sessionId,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
