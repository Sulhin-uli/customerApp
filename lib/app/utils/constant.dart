import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat("#,##0", "eu");
// dialog
void dialog(String title, String msg) {
  Get.defaultDialog(
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
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
