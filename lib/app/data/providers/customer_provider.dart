import 'dart:convert';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CustomerProvider extends GetConnect {
  String url = baseUrl + "customer";

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

  Future<dynamic> showById(
    int id,
    String token,
  ) async {
    final response = await get('$url/$id', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> updateImage(
      Map<String, String> body, String filepath, String token) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(url + '/update/image'))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.add(await http.MultipartFile.fromPath('image', filepath));
    final response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);
    return responseData;
  }

  Future<void> updateData(
    int id,
    String gender,
    String birth,
    String telp,
    String token,
  ) async {
    final response = await put('$url' + '/$id', {
      "id": id,
      "gender": gender,
      "birth": birth,
      "telp": telp,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
