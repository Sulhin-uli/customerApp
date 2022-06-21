import 'package:customer_app/app/data/models/chat_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/chat_provider.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailChatController extends GetxController {
  var chat = List<ChatModel>.empty().obs;
  final box = GetStorage();
  var storeName = ''.obs;
  late TextEditingController text;

  @override
  void onInit() {
    text = TextEditingController();
    getData();
    super.onInit();
  }

  // add data
  void postData(
    int receiver,
    String text,
  ) async {
    final data = box.read("userData") as Map<String, dynamic>;

    if (text != '') {
      ChatProvider()
          .postData(data["id"], receiver, text, data["token"])
          .then((response) {
        final data = ChatModel(
          id: response["data"]["id"],
          senderId: UserModel(
            id: response["data"]["sender_id"]["id"],
            name: response["data"]["sender_id"]["name"],
          ),
          receiverId: UserModel(
            id: response["data"]["receiver_id"]["id"],
            name: response["data"]["receiver_id"]["name"],
          ),
          isHide: response["data"]["is_hide"],
          isRead: response["data"]["is_read"],
          text: response["data"]["text"],
          createdAt: response["data"]["created_at"],
        );
        chat.insert(0, data);
      });
      try {} catch (e) {
        dialog("Terjadi Kesalahan", "Gagal");
      }
    } else {
      dialog("Terjadi Kesalahan", "Input Harus Diisi");
    }
  }

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;

    try {
      ChatProvider().getData(data["token"]).then((response) {
        response["data"].map((e) {
          // print(response);
          final data = ChatModel(
            id: e["id"],
            senderId: UserModel(
              id: e["sender_id"]["id"],
              name: e["sender_id"]["name"],
            ),
            receiverId: UserModel(
              id: e["receiver_id"]["id"],
              name: e["receiver_id"]["name"],
            ),
            isHide: e["is_hide"],
            isRead: e["is_read"],
            text: e["text"],
            createdAt: e["created_at"],
          );
          chat.add(data);
        }).toList();
        storeName.value = chat.first.receiverId!.name!;
      });
    } catch (e) {
      print("Error is : " + e.toString());
    }
  }
}
