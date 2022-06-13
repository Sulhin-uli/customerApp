import 'dart:ui';

import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
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
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Get.toNamed(Routes.DETAIL_CHAT),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black26,
            child: Image.asset("assets/logo/noimage.png"),
          ),
          title: Text(
            "Status ke ${index + 1}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "Status orang ke ${index + 1}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: Chip(label: Text("5")),
        ),
      ),
    );
  }
}
