import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  var hiddenTextPassword = true.obs;
  final formGlobalKey = GlobalKey<FormState>();
  var isLoading = false.obs;

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

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }
}
