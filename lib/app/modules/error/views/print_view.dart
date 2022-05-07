import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PrintView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            Get.arguments.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
