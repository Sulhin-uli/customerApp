import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class WishlistProvider extends GetConnect {
  @override
  String url = baseUrl + "wishlist";

  Future<dynamic> getData(int userId, String token) async {
    final response = await get('$url/user_id/$userId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(int? userId, int? productId, String token) async {
    final response = await post('$url', {
      "user_id": userId,
      "product_id": productId,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> deleteData(
    int? id,
    String token,
  ) async =>
      await delete(url + '/$id', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
}
