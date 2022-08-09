import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String url = baseUrl + "product-customer";
  String errorText = "";

  Future<dynamic> getData(int page) async {
    final response = await get('$url?page=$page');
    return response.body;
  }

  Future<dynamic> getDataSearch(int page, String name) async {
    final response = await get('$url/search/$name?page=$page');
    return response.body;
  }

  Future<dynamic> getDataCategory(int page, int id) async {
    final response = await get('$url/category/$id?page=$page');
    return response.body;
  }

  Future<dynamic> search() async {
    final response = await get('$url');
    return response.body;
  }

  Future<dynamic> findBySlug(String slug) async {
    final response = await get('$url' + '/detail/$slug');
    return response.body;
  }
}
