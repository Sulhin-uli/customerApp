import 'package:customer_app/app/modules/detail_chat/controllers/detail_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailChatView extends GetView<DetailChatController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5),
              InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back),
              ),
              SizedBox(width: 5),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundColor: Colors.grey,
              //   child: Image.asset("assets/logo/noimage.png"),
              // )
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  controller.storeName.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            // Text(
            //   "Lorem Ipsum",
            //   style: TextStyle(
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Obx(
                () => controller.chat.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.chat.length,
                        reverse: true,
                        itemBuilder: (context, i) {
                          int length = controller.chat.length;
                          final data = controller.chat[i];
                          return ItemChat(
                            isSender: true,
                            data: data,
                          );
                        },
                      ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: Get.width,
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: controller.text,
                      decoration: InputDecoration(
                        // prefix: IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.emoji_emotions_outlined),
                        // ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.green,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      controller.postData(Get.arguments, controller.text.text);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.data,
  }) : super(key: key);
  final data;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: isSender
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                    : BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                color: isSender ? Colors.green : Colors.grey),
            padding: EdgeInsets.all(
              15,
            ),
            child: Text(
              data!.text!,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            // Waktu(datetime).yMMMMEEEEd(),
            // datetime.toString(),
            DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .format(DateTime.tryParse(data.createdAt!)!),
          ),
          Text("Belum dibaca",
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey))
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
