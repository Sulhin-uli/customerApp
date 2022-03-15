import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    Container(
                      width: double.infinity,
                      height: 230,
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(24, 16, 16, 16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.crop_square_rounded),
                              title: Text('Nama Toko'),
                              subtitle: Text(
                                'Kabupaten Indramayu',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.crop_square_rounded),
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 100,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name Product",
                                        style: TextStyle(
                                            color: Color(0xff919A92),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Size Kg",
                                        style: TextStyle(
                                            color: Color(0xff919A92),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Rp. 100.000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Color(0xffD1D1D1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.crop_square_rounded),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Pilih Semua",
                        style: TextStyle(
                          color: Color(0xff919A92),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xff919A92),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: Color(0xff919A92),
                                ),
                              ),
                              Text("-")
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff16A085), // background
                            ),
                            child: Text('Beli (0)'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
