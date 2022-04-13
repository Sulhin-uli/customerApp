import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  String url = baseUrl + "register-customer";

  Future<dynamic> register(
      String name, String email, String password, String cPassword) async {
    // Printing is nice, but we want these messages in the UI
    try {
      final response = await post(
        '$url',
        {
          "name": name,
          "email": email,
          "password": password,
          "c_password": cPassword,
        },
      );
      return response.body;
    } on SocketException {
      print('No Internet connection');
    } on HttpException {
      print("Couldn't find the post");
    } on FormatException {
      print("Bad response format");
    }
  }
}
