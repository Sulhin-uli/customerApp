import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class WishlistProvider extends GetConnect {
  @override
  String url = baseUrl + "wishlist";

  Future<dynamic> getData(int userId) async {
    try {
      final response = await get('$url/user_id/$userId');
      return response.body;
    } on SocketException {
      print('No Internet connection');
    } on HttpException {
      print("Couldn't find the post");
    } on FormatException {
      print("Bad response format");
    }
  }

  Future<dynamic> postData(
    int? userId,
    int? productId,
  ) async {
    final response = await post('$url', {
      "user_id": userId,
      "product_id": productId,
    });
    return response.body;
  }

  Future<void> deleteData(int id) async => await delete('$url/$id');
}
