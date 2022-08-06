import 'dart:async';

import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: BackButton(color: Colors.black),
        title: const Text(
          'Masuk',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.offAllNamed(Routes.HOME),
        ),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: const Text(
                "Daftar",
                style: TextStyle(color: Color(0xff16A085), fontSize: 16),
              ))
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formGlobalKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xff919A92),
                  ),
                ),
                TextFormField(
                  validator: controller.emailValidator,
                  controller: controller.email,
                  cursorColor: const Color(0xff16A085),
                  decoration: const InputDecoration(
                    helperText: 'Contoh: pedri16@gmail.com',
                    // fillColor: Color(0xff919A92),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xff919A92),
                  ),
                ),
                Obx(
                  () => TextFormField(
                    validator: controller.passwordValidator,
                    controller: controller.password,
                    cursorColor: const Color(0xff16A085),
                    obscureText: controller.hiddenTextPassword.value,
                    decoration: InputDecoration(
                      // fillColor: Color(0xff919A92),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff919A92),
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff16A085),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hiddenTextPassword.toggle(),
                        icon: controller.hiddenTextPassword.isTrue
                            ? const Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff16A085),
                              )
                            : const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xff16A085),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(
                        color: Color(0xff16A085),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 46, //height of button
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff16A085), // background
                      ),
                      // onPressed: () => authC.login(
                      //     controller.email.text, controller.password.text),
                      onPressed: () {
                        if (controller.formGlobalKey.currentState!.validate()) {
                          controller.isLoading(true);
                          Timer(const Duration(seconds: 3), () {
                            try {
                              authC.login(controller.email.text,
                                  controller.password.text);
                            } finally {
                              controller.isLoading(false);
                            }
                          });
                        }
                      },
                      child: Obx(
                        () => controller.isLoading.isTrue
                            ? const CircularProgressIndicator()
                            : const Text('Masuk'),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         authC.googleLogin();
                //       },
                //       child: Text("Login w google")),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
