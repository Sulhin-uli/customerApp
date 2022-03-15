import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alamat_controller.dart';

class AlamatView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Daftar Alamat',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Tambah Alamat",
                style: TextStyle(color: Color(0xff16A085), fontSize: 16),
              ))
        ],
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                height: 200.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC8FEE0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' jl. lohbener lama, Legok, Kabupate ...',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Name User',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '628123456789',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          'Politeknik Negeri Indramayu, jl. lohbener lama,Legok, Kabupaten Indramayu, Jawa Barat',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Center(
                          child: OutlinedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2.0,
                                color: Color(0xff919A92),
                              ),
                            ),
                            child: Text(
                              'Ubah Alamat',
                              style: TextStyle(
                                color: Color(0xff919A92),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Container(
              //   margin: EdgeInsets.all(16),
              //   height: 250,
              //   width: double.infinity,
              //   color: Color(0xffC8FEE0),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
