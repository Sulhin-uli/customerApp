import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCart extends GetView<CartController> {
  ItemCart(this.data);
  final data;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Row(
            children: [
              Checkbox(
                  value: data.isMark!,
                  onChanged: (e) {
                    data.isMark = e;
                    controller.cart.refresh();
                    controller.addLengthMark();
                    controller.addTotal();
                    controller.checkMark();
                    controller.checkAllMark();
                  }),
              Column(
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
                          padding: EdgeInsets.all(7),
                          height: 100,
                          width: 100,
                          child: Image.network(
                            baseUrlFile +
                                "storage/produk/" +
                                data.productId!.image!,
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
                              // "Rp. 100.000",
                              'Rp ${formatCurrency.format(data.productId.price!)}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
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
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(5.0) //
                              ),
                        ), //
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            (data.productQty! == 1)
                                ? InkWell(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      controller.updateQty(
                                          data.id!, data.productQty! - 1);
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            Text(
                              data.productQty!.toString(),
                              style: TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                controller.updateQty(
                                    data.id!, data.productQty! + 1);
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
