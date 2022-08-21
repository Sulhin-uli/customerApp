import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class TransactionProvider extends GetConnect {
  @override
  String url = baseUrl + "transaction_list";

  Future<dynamic> getData(int id, int page, String token) async {
    final response = await get("$url/$id?page=$page", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getDataDetail(
    int? id,
    int? userId,
    String? token,
  ) async {
    final response = await post('$url/detail_transaction/$id', {
      "user_id": userId,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> orderCompleted(
    int? id,
    String? token,
  ) async {
    final response = await post('$url/order_completed', {
      "id": id,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> cancelOrder(
    int? id,
    String? token,
  ) async {
    final response = await post('$url/order_cancel', {
      "id": id,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
