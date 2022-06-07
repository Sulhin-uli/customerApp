import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String url = baseUrl + "user/";

  Future<dynamic> postData(
    String name,
    String token,
  ) async {
    final response = await post(url, {
      "name": name,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getData(
    String token,
  ) async {
    final response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getDataById(
    int id,
    String token,
  ) async {
    final response = await get(url + id.toString(), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateData(
    int id,
    String password,
    String token,
  ) async {
    final response = await put(url + '$id', {
      "id": id,
      "password": password,
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
