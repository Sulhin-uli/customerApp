import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Daftar',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Masuk",
              style: TextStyle(color: Color(0xff16A085), fontSize: 16),
            ),
          )
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Nama",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.name,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: Pedri Gonzales',
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
                "Email",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.email,
                cursorColor: Color(0xff16A085),
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
                  controller: controller.password,
                  cursorColor: Color(0xff16A085),
                  obscureText: controller.hiddenTextPassword.value,
                  decoration: InputDecoration(
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
                    suffixIcon: IconButton(
                      onPressed: () => controller.hiddenTextPassword.toggle(),
                      icon: controller.hiddenTextPassword.isTrue
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff16A085),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff16A085),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Konfirmasi Password",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.cPassword,
                  cursorColor: Color(0xff16A085),
                  obscureText: controller.hiddenTextPassword.value,
                  decoration: InputDecoration(
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
                    suffixIcon: IconButton(
                      onPressed: () => controller.hiddenTextPassword.toggle(),
                      icon: controller.hiddenTextPassword.isTrue
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff16A085),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff16A085),
                            ),
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
                    onPressed: () => controller.register(
                      controller.name.text,
                      controller.email.text,
                      controller.password.text,
                      controller.cPassword.text,
                    ),
                    child: const Text('Daftar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
