import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Status Pesanan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.notif.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/empty-data.svg",
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                "Data Tidak Ada",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.notif.length,
                          itemBuilder: (context, i) {
                            final data = controller.notif[i];
                            return Card(
                              elevation: 0.5,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: double.infinity,
                                color: Color(0xffEAFFEE),
                                child: ListTile(
                                  // leading: CircleAvatar(
                                  //   backgroundImage: AssetImage(
                                  //     "assets/icons/kategori.png",
                                  //   ),
                                  // ),
                                  title: Text(
                                    data.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    data.body!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
