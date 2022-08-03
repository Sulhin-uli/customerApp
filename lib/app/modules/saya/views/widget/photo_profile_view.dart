import 'dart:io';

import 'package:customer_app/app/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoProfileView extends GetView {
  @override
  Widget build(BuildContext context) {
    // return Image.file(
    //   File(Get.arguments),
    //   height: 150,
    //   width: 150,
    //   fit: BoxFit.cover,
    // );
    return Container(
        child: PhotoView(
      imageProvider: FileImage(File(Get.arguments)),
    ));
  }
}

class PhotoProfileUrlView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider:
          NetworkImage(baseUrlFile + "storage/profile/" + Get.arguments),
    ));
  }
}
