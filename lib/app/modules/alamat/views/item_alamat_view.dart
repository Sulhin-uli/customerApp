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
                  data.completeAddress!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
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
                            color: Color(0xff919A92),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            controller.dialogQuestion(context, data.id!),
                        icon: Icon(Icons.delete))
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
