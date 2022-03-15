import 'dart:ui';

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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                  ),
                  title: Text(
                    'Gapoktan',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Isi chat',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "<1 m",
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: new Text(
                          "5",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 10.0),
                        ),
                      ), //............
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
