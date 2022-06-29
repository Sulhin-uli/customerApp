import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/register/providers/register_provider.dart';
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
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Email tidak valid'),
  ]);
  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    MinLengthValidator(8, errorText: 'Minimal 8 karakter'),
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
        dialog("Daftar Berhasil!", "Silahkan Login");
      });
      // authController.login(email, password);
      Get.back();
    } else {
      dialog("Peringatan", "Daftar Gagal!");
    }
  }
}
