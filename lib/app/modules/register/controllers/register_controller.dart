import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/register/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController cPassword;
  var hiddenTextPassword = true.obs;
  AuthController authController = Get.put(AuthController());

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
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  void register(String name, String email, String password, String cPassword) {
    if (name != '') {
      RegisterProvider()
          .register(name, email, password, cPassword)
          .then((response) {
        dialog("Peringatan", "Daftar Berhasil!");
      });
      authController.login(email, password);
    } else {
      dialog("Peringatan", "Daftar Gagal!");
    }
  }
}
