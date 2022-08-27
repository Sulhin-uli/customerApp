import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Product extends GetView<HomeController> {
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
            () => controller.produkController.productHome.isEmpty
                ? CircularProgressIndicator()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.produkController.productHome.length,
                    itemBuilder: (context, index) {
                      final data =
                          controller.produkController.productHome[index];
                      var dataImage;
                      try {
                        dataImage = controller.produkController.photoProduct
                            .where((e) => e.productId!.id == data.id)
                            .first
                            .name;
                      } catch (e) {
                        // print(e);
                        dataImage = false;
                      }
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PRODUK,
                              arguments: [data.slug!, "home"]);

                          // Get.toNamed(
                          //   Routes.DETAIL_PRODUK,
                          //   arguments: data.slug!,
                          // );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            children: <Widget>[
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
                                      child: Container(
                                        width: 130,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                baseUrlFile +
                                                    "storage/produk/" +
                                                    dataImage!,
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
                                            Icons.store,
                                            color: Colors.purple,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.userId!.name!,
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
