import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAlamatView extends GetView<AlamatController> {
  ItemAlamatView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 8, 8, 16),
        height: 200.0,
        width: 300.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: (data.mainAddress! == 1) ? Color(0xffC8FEE0) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.completeAddress!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    (data.mainAddress == 1)
                        ? SizedBox(
                            height: 25, //height of button
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE3BAC1), // background
                              ),
                              onPressed: () {},
                              child: Text(
                                'Utama',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Text(
                  data.recipientsName!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  data.telp!,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  data.completeAddress!,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Row(
                  children: [
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(Routes.EDIT_ALAMAT, arguments: data.id!);
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    (data.mainAddress == 0)
                        ? IconButton(
                            onPressed: () {
                              controller.moreQuestion(context, data.id!);
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
