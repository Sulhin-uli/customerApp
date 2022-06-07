import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProduct extends GetView<ProdukController> {
  ItemProduct(this.data);
  final data;
  final productC = Get.find<HomeController>();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.DETAIL_PRODUK,
          arguments: data.slug!,
        );
        controller.photoProductByProductId.clear();
        productC.photoProductByProductId.clear();
        controller.getPhotoProductById(data.id!);
        productC.getPhotoProductById(data.id!);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                  tag: data.slug,
                  child: Center(
                    child: Image.network(
                      baseUrlFile + "storage/produk/" + data.image!,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                data.name,
                style: TextStyle(
                    color: Color(0xff919A92),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                'Rp ${formatCurrency.format(data.price!)}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
