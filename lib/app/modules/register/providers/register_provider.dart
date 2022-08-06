import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  String url = baseUrl + "register-customer";

  Future<dynamic> register(
      String name, String email, String password, String cPassword) async {
    final response = await post(
      '$url',
      {
        "name": name,
        "email": email,
        "password": password,
        "cpassword": cPassword,
      },
    );
    return response.body;
  }
}
