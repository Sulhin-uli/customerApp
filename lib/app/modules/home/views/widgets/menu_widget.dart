import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Obx(
        () => controller.menu.isEmpty &&
                controller.produkController.productCategory.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: controller.produkController.productCategory
                    .where((e) => e.isActive == 1)
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.25),
                itemBuilder: (context, index) {
                  final data = controller.menu[index];
                  final dataCategory =
                      controller.produkController.productCategory[index];
                  if (dataCategory.isActive == 1) {
                    return Column(
                      children: [
                        Container(
                          // color: index % 2 == 0 ? Colors.amber : Colors.red,
                          width: 40,
                          height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(color: Colors.black12)),
                            padding: EdgeInsets.all(8),
                            color: Colors.white,
                            onPressed: () {
                              Get.toNamed(Routes.KATEGORI_VIEW,
                                  arguments: dataCategory.name);
                            },
                            child: (data.image! != null)
                                ? Image.asset(data.image!)
                                : Image.asset("assets/icons/kategori.png"),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          (dataCategory.name! != null)
                              ? dataCategory.name!
                              : "Kategori",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff919A92)),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
      ),
    );
  }
}
