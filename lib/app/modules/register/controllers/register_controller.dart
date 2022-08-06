import 'dart:async';

import 'package:customer_app/app/data/models/validator_register.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/register/providers/register_provider.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController cPassword;
  var hiddenTextPassword = true.obs;
  var hiddenTextPassword2 = true.obs;
  AuthController authController = Get.put(AuthController());
  final formGlobalKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final requiredValidator =
      RequiredValidator(errorText: 'kolom tidak boleh kosong');
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    MinLengthValidator(6, errorText: 'Minimal 6 karakter'),
    MaxLengthValidator(50, errorText: 'Maksimal 50 karakter'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Email tidak valid'),
    MaxLengthValidator(100, errorText: 'Maksimal 100 karakter'),
  ]);
  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    MinLengthValidator(6, errorText: 'Minimal 6 karakter'),
    MaxLengthValidator(50, errorText: 'Maksimal 50 karakter'),
  ]);

  @override
  void onInit() {
    super.onInit();

    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    cPassword = TextEditingController();
  }

  void dialog(String title, String msg) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontSize: 12),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  void register(String name, String email, String password, String cPassword) {
    try {
      isLoading(true);
      try {
        RegisterProvider()
            .register(name, email, password, cPassword)
            .then((response) {
          // print(response);
          try {
            if (response["status"] == 400) {
              dialog("Peringatan", response["messages"]["email"][0]);
            }
          } catch (e) {
            Get.back();
            dialog("Berhasil!",
                "Akun anda berhasil terdaftar, Silahkan cek email untuk verifikasi email anda!");
          }
        });
      } catch (e) {
        dialog("Peringatan", "Daftar Gagal!");
      }
    } finally {
      Timer(const Duration(seconds: 5), () {
        isLoading(false);
      });
    }
  }
}
