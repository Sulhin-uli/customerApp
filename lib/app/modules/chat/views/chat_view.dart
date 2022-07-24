import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.chatsStream(authC.user.value.email!),
        builder: (context, snapshot1) {
          if (snapshot1.connectionState == ConnectionState.active) {
            var listDocsChats = snapshot1.data!.docs;
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: listDocsChats.length,
              itemBuilder: (context, index) {
                return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: controller
                      .friendStream(listDocsChats[index]["connection"]),
                  builder: (context, snapshot2) {
                    if (snapshot2.connectionState == ConnectionState.active) {
                      var data = snapshot2.data!.data();
                      return data!["status"] == ""
                          ? ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              onTap: () => controller.goToChatRoom(
                                "${listDocsChats[index].id}",
                                authC.user.value.email!,
                                listDocsChats[index]["connection"],
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black26,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: data["photoUrl"] == "noimage"
                                      ? Image.asset(
                                          "assets/logo/noimage.png",
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          "${data["photoUrl"]}",
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              title: Text(
                                "${data["name"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: listDocsChats[index]["total_unread"] ==
                                      0
                                  ? SizedBox()
                                  : Chip(
                                      backgroundColor: Colors.red[900],
                                      label: Text(
                                        "${listDocsChats[index]["total_unread"]}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                            )
                          : ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              onTap: () => controller.goToChatRoom(
                                "${listDocsChats[index].id}",
                                authC.user.value.email!,
                                listDocsChats[index]["connection"],
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black26,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: data["photoUrl"] == "noimage"
                                      ? Image.asset(
                                          "assets/logo/noimage.png",
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          "${data["photoUrl"]}",
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              title: Text(
                                "${data["name"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "${data["status"]}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: listDocsChats[index]["total_unread"] ==
                                      0
                                  ? SizedBox()
                                  : Chip(
                                      backgroundColor: Colors.green,
                                      label: Text(
                                        "${listDocsChats[index]["total_unread"]}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                            );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     authC.addNewConnection("sulhinhin24@gmail.com");
      //   },
      //   child: Icon(
      //     Icons.search,
      //     size: 30,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Colors.grey,
      // ),
    );
  }
}

class ItemChatRoom extends StatelessWidget {
  const ItemChatRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.DETAIL_CHAT),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black26,
        child: Image.asset("assets/logo/noimage.png"),
      ),
      title: Text(
        "Status ke 1",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "Status orang ke 1 ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: Chip(label: Text("5")),
    );
  }
}
