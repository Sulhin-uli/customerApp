import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String url = baseUrl + "product";
  String errorText = "";

  Future<dynamic> getData() async {
    final response = await get('$url');
    return response.body;
  }

  Future<dynamic> search() async {
    final response = await get('$url');
    return response.body;
  }

  Future<dynamic> findBySlug(String slug) async {
    final response = await get('$url' + '/$slug');
    return response.body;
  }
}
