import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';
import 'package:givestarreviews/givestarreviews.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          elevation: 0.5,
          title: Text(
            'Ulasan Produk',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.image,
                        size: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 30),
                StarRating(onChanged: (rate) {
                  print(rate);
                }),
                const SizedBox(height: 30),
                const Text(
                  "Ulasan",
                  style: TextStyle(
                    color: Color(0xff919A92),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 5,

                  // controller: controller.completeAddress,
                  cursorColor: const Color(0xff16A085),
                  decoration: InputDecoration(
                    // helperText: 'Contoh: Isi ulasan',
                    // fillColor: Color(0xff919A92),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 46, //height of button
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff16A085), // background
                      ),
                      // onPressed: () => authC.login(
                      //     controller.email.text, controller.password.text),
                      onPressed: () {},
                      child: const Text('Kirim'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
