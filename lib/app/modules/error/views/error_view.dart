import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/error_controller.dart';

class ErrorView extends GetView<ErrorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Get.arguments,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
