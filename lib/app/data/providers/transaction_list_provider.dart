import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class TransactionProvider extends GetConnect {
  @override
  String url = baseUrl + "transaction_list";

  Future<dynamic> getData(int id, String token) async {
    final response = await get("$url/$id", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
