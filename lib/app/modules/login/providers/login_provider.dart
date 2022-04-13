import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  String url = baseUrl + "register-customer";

  Future<dynamic> login(String email, String password) async {
    final response =
        await post('$url' + 'login', {"email": email, "password": password});
    return response.body;
  }

  Future<dynamic> logout(int id, String? token) async {
    final response = await post('$url' + "logout", {
      "id": id
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
