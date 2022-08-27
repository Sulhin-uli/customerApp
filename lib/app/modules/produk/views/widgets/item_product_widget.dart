import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProduct extends GetView<ProdukController> {
  ItemProduct(this.data, {required this.isData});
  final data;
  String isData;

  Widget build(BuildContext context) {
    var dataImage;

    try {
      dataImage = controller.photoProduct
          .where((e) => e.productId!.id == data.id)
          .first
          .name;
    } catch (e) {
      // print(e);
      dataImage = false;
    }
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_PRODUK, arguments: [data.slug!, isData]);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            (dataImage == false)
                ? Expanded(
                    child: Container(
                      width: 130,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Center(child: Text("No Image")),
                    ),
                    flex: 75,
                  )
                : Expanded(
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
