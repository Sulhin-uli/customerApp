import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWishlist extends GetView<WishlistController> {
  ItemWishlist(this.data);
  final data;
  CartController cartController = Get.put(CartController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final dataImage = controller.produkController.photoProduct
        .where((e) => e.productId!.id == data.productId!.id)
        .first
        .name;
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  homeController.photoProductByProductId.clear();
                  homeController.getPhotoProductById(data.productId!.id!);
                  Get.toNamed(
                    Routes.DETAIL_PRODUK,
                    arguments: data.productId!.slug!,
                  );
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 100,
                      width: 100,
                      child: Image.network(
                        baseUrlFile + "storage/produk/" + dataImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.productId.name,
                          // "Beras",
                          style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          data.productId.stoke.toString(),
                          style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          // "Rp. 100.000",
                          'Rp ${formatCurrency.format(data.productId.price!)}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // color: index % 2 == 0 ? Colors.amber : Colors.red,
                    width: 45,
                    height: 45,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(color: Colors.black12)),
                      padding: EdgeInsets.all(8),
                      color: Colors.white,
                      onPressed: () {
                        controller.deleteData(data.id!);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      cartController.postData(data.productId.id, 1);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: Color(0xff16A085)),
                    ),
                    child: Text(
                      '      + Keranjang      ',
                      style: TextStyle(
                        color: Color(0xff16A085),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
