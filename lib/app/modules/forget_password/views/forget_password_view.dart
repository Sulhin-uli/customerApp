import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: const Text(
          'Lupa Kata Sandi',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
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
                  "Kami akan mengirimkan tautan untuk mengatur ulang kata sandi Anda",
                  style: TextStyle(
                      // color: Color(0xff919A92),
                      ),
                ),
                const SizedBox(height: 16),
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
                            controller.postData(controller.email.text);
                          });
                        }
                      },
                      child: Obx(
                        () => controller.isLoading.isTrue
                            ? const CircularProgressIndicator()
                            : const Text('Kirim'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
