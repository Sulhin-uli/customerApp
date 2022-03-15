import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/toko_controller.dart';

class TokoView extends GetView<TokoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          elevation: 0.5,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.account_circle_rounded,
                          size: 60,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Gapoktan",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Indramayu ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4.2",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rating dan Ulasan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            child: VerticalDivider(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 2.0, color: Color(0xff16A085)),
                            ),
                            child: Text(
                              '     Chat    ',
                              style: TextStyle(
                                color: Color(0xff16A085),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    "Semua Produk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                      itemCount: 11,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // final product = productList[index];
                        return GestureDetector(
                          // onTap: () => Get.toNamed(Routes.DETAIL_EDUKASI),
                          onTap: () {},
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                      tag: 'judul',
                                      child: Center(
                                        child: Image.network(
                                          "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                                          // fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                ListTile(
                                  title: Text(
                                    "Name Product",
                                    style: TextStyle(
                                        color: Color(0xff919A92),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: Text(
                                    "Rp. 100.000",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        ;
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
