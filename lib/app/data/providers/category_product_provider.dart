import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/category_product_model.dart';

class CategoryProductProvider extends GetConnect {
  @override
  String url = baseUrl + "product-category";

  Future<dynamic> getData() async {
    try {
      final response = await get('$url');
      return response.body;
    } on SocketException {
      print('No Internet connection');
    } on HttpException {
      print("Couldn't find the post");
    } on FormatException {
      print("Bad response format");
    }
  }
}
