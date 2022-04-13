import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends GetView<HomeController> {
  const Product({
    Key? key,
  }) : super(key: key);

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.DETAIL_PRODUK),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 130,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Name Product",
                                style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Rp. 100.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
        )
      ],
    );
  }
}
