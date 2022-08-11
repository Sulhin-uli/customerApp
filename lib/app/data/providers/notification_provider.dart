import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationProvider extends GetConnect {
  @override
  String url = baseUrl + "notification";

  Future<dynamic> getData(int userId, String token) async {
    final response = await get(url + '_list/$userId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> deleteAll(String token, int id) async {
    final response = await get(url + '_list/delete-all/$id', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
