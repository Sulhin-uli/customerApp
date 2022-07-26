// import 'package:customer_app/app/data/models/chat_model.dart';
// import 'package:customer_app/app/data/models/chat_room_model.dart';
// import 'package:customer_app/app/data/providers/chat_provider.dart';
// import 'package:customer_app/app/data/providers/room_chat_provider.dart';
// import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> chatsStream(String email) {
    return firestore
        .collection('users')
        .doc(email)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> friendStream(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  void goToChatRoom(String chat_id, String email, String friendEmail) async {
    CollectionReference chats = firestore.collection('chats');
    CollectionReference users = firestore.collection('users');

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users
        .doc(email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});

    Get.toNamed(
      Routes.DETAIL_CHAT,
      arguments: {
        "chat_id": chat_id,
        "friendEmail": friendEmail,
      },
    );
  }

  /// controller
  ///

  // FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Stream<QuerySnapshot<Map<String, dynamic>>> chatStream(String email) {
  //   return fireStore
  //       .collection('users')
  //       .doc(email)
  //       .collection("chats")
  //       .orderBy("lastTime", descending: true)
  //       .snapshots();
  // }

  // Stream<DocumentSnapshot<Map<String, dynamic>>> friendStream(String email) {
  //   return fireStore.collection('users').doc(email).snapshots();
  // }

  // var roomChat = List<RoomChatModel>.empty().obs;
  // final authC = Get.put(AuthController());

  // final box = GetStorage();

  // @override
  // void onInit() {
  //   if (authC.isAuth.isTrue) {
  //     getData();
  //   }
  //   super.onInit();
  // }

  // void getData() async {
  //   final data = box.read("userData") as Map<String, dynamic>;

  //   try {
  //     RoomChatProvider().getData(data["token"]).then((response) {
  //       response["data"].map((e) {
  //         final data = RoomChatModel(
  //           id: e["id"],
  //           isHide: e["is_hide"],
  //           chat: ChatModel(
  //             id: e["chat_id"]["id"],
  //             isHide: e["chat_id"]["is_hide"],
  //             isRead: e["chat_id"]["is_read"],
  //             text: e["chat_id"]["text"],
  //             createdAt: e["chat_id"]["created_at"],
  //           ),
  //         );
  //         roomChat.add(data);
  //       }).toList();
  //     });
  //   } catch (e) {
  //     print("Error is : " + e.toString());
  //   }
  // }

}
