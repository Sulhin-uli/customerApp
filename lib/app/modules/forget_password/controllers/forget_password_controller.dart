import 'dart:async';

import 'package:customer_app/app/data/providers/forget_password_provider.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  var hiddenTextPassword = true.obs;
  final formGlobalKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Email tidak valid'),
    MaxLengthValidator(100, errorText: 'Maksimal 100 karakter'),
  ]);

  void postData(String email) async {
    try {
      isLoading(true);
      try {
        ForgetPasswordProvider().postData(email).then((response) {
          // print(response);
          try {
            if (response["status"] != 200) {
              dialog("Peringatan", response["messages"]);
            } else {
              Get.back();
              dialog("Berhasil!",
                  "Tautan atur ulang kata sandi telah dikirim ke email anda!");
            }
          } catch (e) {
            Get.back();
            dialog("Berhasil!",
                "Tautan atur ulang kata sandi telah dikirim ke email anda!");
          }
        });
      } catch (e) {
        dialog("Peringatan", "Kirim Email Gagal!");
      }
    } finally {
      Timer(const Duration(seconds: 5), () {
        isLoading(false);
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }
}
