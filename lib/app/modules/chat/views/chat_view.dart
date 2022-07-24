import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  AuthController authController = Get.put(AuthController());

  // List dataTemp = List.generate(
  //   10,
  //   (i) => ListTile(
  //     onTap: () => Get.toNamed(Routes.DETAIL_CHAT),
  //     leading: CircleAvatar(
  //       radius: 30,
  //       backgroundColor: Colors.black26,
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(100),
  //         child: Image.asset("assets/logo/noimage.png"),
  //       ),
  //     ),
  //     title: Text(
  //       "Orang ke-${i + 1}",
  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  //     ),
  //     subtitle: Text(
  //       "Status ke-${i + 1}",
  //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  //     ),
  //     trailing: Chip(label: Text("3")),
  //   ),
  // ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.chatStream(authController.user.value.email!),
          builder: (context, snapshot1) {
            if (snapshot1.connectionState == ConnectionState.active) {
              var listDocsChats = snapshot1.data!.docs;
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot1.data!.docs.length,
                itemBuilder: (context, index) {
                  return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: controller
                        .friendStream(listDocsChats[index]["connection"]),
                    builder: (context, snapshot2) {
                      if (snapshot2.connectionState == ConnectionState.active) {
                        var data = snapshot2.data!.data();
                        return data!["status"] == ""
                            ? ListTile(
                                onTap: () =>
                                    Get.toNamed(Routes.DETAIL_CHAT, arguments: {
                                  "chat_id": "${listDocsChats[index].id}",
                                  "friendEmail": listDocsChats[index]
                                      ["connection"],
                                }),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black26,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: data["photoUrl"] == "no image"
                                        ? Image.asset("assets/logo/noimage.png")
                                        : Image.network(data["photoUrl"]),
                                  ),
                                ),
                                title: Text(
                                  "${data["email"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: listDocsChats[index]
                                            ["total_unread"] ==
                                        0
                                    ? SizedBox()
                                    : Chip(
                                        label: Text(
                                            "${listDocsChats[index]["total_unread"]}")),
                              )
                            : ListTile(
                                onTap: () => Get.toNamed(Routes.DETAIL_CHAT,
                                    arguments: "${listDocsChats[index].id}"),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black26,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: data["photoUrl"] == "no image"
                                        ? Image.asset("assets/logo/noimage.png")
                                        : Image.network(data["photoUrl"]),
                                  ),
                                ),
                                title: Text(
                                  "${data["email"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  "${data["status"]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: listDocsChats[index]
                                            ["total_unread"] ==
                                        0
                                    ? SizedBox()
                                    : Chip(
                                        label: Text(
                                            "${listDocsChats[index]["total_unread"]}")),
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
      ),
      // body: ListView.builder(
      //   itemCount: dataTemp.length,
      //   itemBuilder: (context, index) => dataTemp[index],
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      //       stream: controller.chatStream(authController.user.value.email!),
      //       builder: (context, snapshot2) {
      //         if (snapshot2.connectionState == ConnectionState.active) {
      //           // print(snapshot2.data!.data());
      //           var allChats = (snapshot2.data!.data()
      //               as Map<String, dynamic>)["chats"] as List;
      //           return ListView.builder(
      //               padding: EdgeInsets.zero,
      //               itemCount: allChats.length,
      //               itemBuilder: (context, index) {
      //                 return StreamBuilder<
      //                     DocumentSnapshot<Map<String, dynamic>>>(
      //                   stream: controller
      //                       .friendStream(allChats[index]["connection"]),
      //                   builder: (context, snapshot2) {
      //                     if (snapshot2.connectionState ==
      //                         ConnectionState.active) {
      //                       var data = snapshot2.data!.data();
      //                       return data!["status"] == ""
      //                           ? ListTile(
      //                               onTap: () =>
      //                                   Get.toNamed(Routes.DETAIL_CHAT),
      //                               leading: CircleAvatar(
      //                                 radius: 30,
      //                                 backgroundColor: Colors.black26,
      //                                 child: ClipRRect(
      //                                   borderRadius:
      //                                       BorderRadius.circular(100),
      //                                   child: data["photoUrl"] == "no image"
      //                                       ? Image.asset(
      //                                           "assets/logo/noimage.png")
      //                                       : Image.network(data["photoUrl"]),
      //                                 ),
      //                               ),
      //                               title: Text(
      //                                 "${data["name"]}",
      //                                 style: TextStyle(
      //                                     fontSize: 20,
      //                                     fontWeight: FontWeight.w600),
      //                               ),
      //                               trailing: allChats[index]["total_unread"] ==
      //                                       0
      //                                   ? SizedBox()
      //                                   : Chip(
      //                                       label: Text(
      //                                           "${allChats[index]["total_unread"]}")),
      //                             )
      //                           : ListTile(
      //                               onTap: () =>
      //                                   Get.toNamed(Routes.DETAIL_CHAT),
      //                               leading: CircleAvatar(
      //                                 radius: 30,
      //                                 backgroundColor: Colors.black26,
      //                                 child: ClipRRect(
      //                                   borderRadius:
      //                                       BorderRadius.circular(100),
      //                                   child: data["photoUrl"] == "no image"
      //                                       ? Image.asset(
      //                                           "assets/logo/noimage.png")
      //                                       : Image.network(data["photoUrl"]),
      //                                 ),
      //                               ),
      //                               title: Text(
      //                                 "${data!["name"]}",
      //                                 style: TextStyle(
      //                                     fontSize: 20,
      //                                     fontWeight: FontWeight.w600),
      //                               ),
      //                               subtitle: Text(
      //                                 "${data["status"]}",
      //                                 style: TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.w600),
      //                               ),
      //                               trailing: allChats[index]["total_unread"] ==
      //                                       0
      //                                   ? SizedBox()
      //                                   : Chip(
      //                                       label: Text(
      //                                           "${allChats[index]["total_unread"]}")),
      //                             );
      //                     }
      //                     return Center(
      //                       child: CircularProgressIndicator(),
      //                     );
      //                   },
      //                 );
      //               });
      //         }
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthController authController = Get.put(AuthController());
          authController.addNewConnection("sulhinhin8@gmail.com");
        },
        child: Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[900],
      ),
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
