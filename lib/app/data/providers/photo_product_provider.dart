import 'dart:convert';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class PhotoProductProvider extends GetConnect {
  String url = baseUrl + "product-photo-customer";

  Future<dynamic> getData() async {
    final response = await get(
      url,
    );
    return response.body;
  }
}
