import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat("#,##0", "eu");
// dialog
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
  Future.delayed(const Duration(seconds: 3), () {
    Get.back();
  });
}

void dialogNoBack(String title, String msg) {
  Get.defaultDialog(
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  );
}

void dialogSuccess(String msg) {
  Get.defaultDialog(
    title: " ",
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          msg,
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: () => Get.back(), child: Text("Tutup"))
      ],
    ),
  );
}

void dialogError(String msg) {
  // Get.defaultDialog(title: "Peringatan", middleText: msg);
  Get.defaultDialog(
    title: "Peringatan",
    titleStyle: TextStyle(fontSize: 12),
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12),
    ),
  );
}
