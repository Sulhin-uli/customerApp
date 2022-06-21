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

  Widget build(BuildContext context) {
    final dataImage = controller.photoProduct
        .where((e) => e.productId!.id == data.id)
        .first
        .name;
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.DETAIL_PRODUK,
          arguments: data.slug!,
        );
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
                      baseUrlFile + "storage/produk/" + dataImage!,
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
                'Rp${formatCurrency.format(data.price!)}',
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
