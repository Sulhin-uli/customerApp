import 'package:customer_app/app/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider:
          NetworkImage(baseUrlFile + "storage/produk/" + Get.arguments),
    ));
  }
}
