import 'package:customer_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditPasswordView extends GetView<SayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Ubah Password',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password saat ini",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordCurrent,
                  cursorColor: const Color(0xff16A085),
                  obscureText: controller.hiddenTextPasswordCurrent.value,
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
                      onPressed: () =>
                          controller.hiddenTextPasswordCurrent.toggle(),
                      icon: controller.hiddenTextPasswordCurrent.isTrue
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
              const Text(
                "Password baru",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordNew,
                  cursorColor: const Color(0xff16A085),
                  obscureText: controller.hiddenTextPasswordNew.value,
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
                      onPressed: () =>
                          controller.hiddenTextPasswordNew.toggle(),
                      icon: controller.hiddenTextPasswordNew.isTrue
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
              const Text(
                "Konfirmasi password",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordConfirm,
                  cursorColor: const Color(0xff16A085),
                  obscureText: controller.hiddenTextPasswordConfirm.value,
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
                      onPressed: () =>
                          controller.hiddenTextPasswordConfirm.toggle(),
                      icon: controller.hiddenTextPasswordConfirm.isTrue
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
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.editPassword(
                      controller.passwordCurrent.text,
                      controller.passwordNew.text,
                      controller.passwordConfirm.text,
                    ),
                    child: const Text('Ubah'),
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
