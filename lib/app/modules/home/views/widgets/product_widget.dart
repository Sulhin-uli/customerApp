import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Product extends GetView<HomeController> {
  ProdukController produkController = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          color: Color(0xff16A085),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 220,
          ),
          child: Obx(
            () => controller.product.isEmpty
                ? CircularProgressIndicator()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      final data = controller.product[index];
                      return GestureDetector(
                        onTap: () {
                          controller.photoProductByProductId.clear();
                          controller.getPhotoProductById(data.id!);
                          Get.toNamed(
                            Routes.DETAIL_PRODUK,
                            arguments: data.slug!,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: 130,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        // image: NetworkImage(
                                        //   "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                                        // ),
                                        image: NetworkImage(
                                          baseUrlFile +
                                              "storage/produk/" +
                                              data.image!,
                                        ),
                                        // fit: BoxFit.fitHeight,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8))),
                                ),
                                flex: 75,
                              ),
                              Expanded(
                                flex: 25,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  width: 130,
                                  height: 220,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // Text(
                                      //   data.name!,
                                      //   style: TextStyle(
                                      //       color: Color(0xff919A92),
                                      //       fontSize: 12,
                                      //       fontWeight: FontWeight.w400),
                                      // ),
                                      // SizedBox(
                                      //   height: 4,
                                      // ),
                                      Text(
                                        'Rp ${formatCurrency.format(data.price!)}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: Colors.purple,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'Indramayu',
                                            style: TextStyle(
                                              color: Color(0xff919A92),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
