import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/app/data/models/checkout_model.dart';
import 'package:customer_app/app/data/models/customer_model.dart';
import 'package:customer_app/app/data/models/user_customer_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/models/users_model.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/login/providers/login_provider.dart';
import 'package:customer_app/app/modules/notifikasi/controllers/notifikasi_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  var customer = List<CustomerModel>.empty().obs;
  var user = UsersModel().obs;
  var userCustomer = List<UserCustomer>.empty().obs;

  // HomeController _homeController = HomeController();
  CartController cartController = Get.put(CartController());
  NotifikasiController notifikasiController = Get.put(NotifikasiController());

  GoogleSignIn _googleSignIn = new GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> googleLogin() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        print("berhasil login");
        print(_currentUser);

        final goolgeAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: goolgeAuth.idToken,
          accessToken: goolgeAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("User Credential");
        print(userCredential);

        // Masukkan data ke firebase
        CollectionReference users = firestore.collection('users');
        final checkuser = await users.doc(_currentUser!.email).get();

        if (checkuser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl,
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updateTime": DateTime.now().toIso8601String(),
            // "chats": []
          });

          await users.doc(_currentUser!.email).collection("chats");
        } else {
          await users.doc(_currentUser!.email).update({
            "lastSignTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));
        user.refresh();

        final listChat =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChat.docs.isNotEmpty) {
          List<ChatUser> dataListChats = [];
          listChat.docs.forEach((element) {
            var dataDoChat = element.data();
            var dataDoChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDoChatId,
              connection: dataDoChat["connection"],
              lastTime: dataDoChat["lastTime"],
              total_unread: dataDoChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        user.refresh();

        Get.toNamed(Routes.CHAT);
      } else {
        print("tidak berhasil login");
      }
    } catch (error) {
      print(error);
    }
  }

  void addNewConnection2(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection("chats");
    CollectionReference users = firestore.collection("users");

    final docChats =
        await users.doc(_currentUser!.email).collection("chats").get();

    // if (docChats) {}
    if (docChats.docs.isNotEmpty) {
      // user sudah pernah chat dgn siapapun
      final checkConnection = await users
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();

      if (checkConnection.docs.isNotEmpty) {
        // Sudah pernah buat koneksi dengan friendsemail
        flagNewConnection = false;

        chat_id = checkConnection.docs[0].id; // chat_id from chat collection
      } else {
        // Belum pernah chat dengan siapapun

        // buat koneksi
        flagNewConnection = true;
      }
    } else {
      // Belum pernah chat dengan siapapun

      // buat koneksi
      flagNewConnection = true;
    }
    if (flagNewConnection) {
      // cek dari collection => connection => dari mereka berdua

      final chatDocs = await chats.where(
        "connections",
        whereIn: [
          [
            _currentUser!.email,
            friendEmail,
          ],
          [
            friendEmail,
            _currentUser!.email,
          ],
        ],
      ).get();

      if (chatDocs.docs.isNotEmpty) {
        // terdapat data chats (sudah ada koneksi antara mereka berdua)
        final chatDataId = chatDocs.docs[0].id;
        final chatsData = chatDocs.docs[0].data() as Map<String, dynamic>;

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        final listChat =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChat.docs.isNotEmpty) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChat.docs.forEach((element) {
            var dataDoChat = element.data();
            var dataDoChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDoChatId,
              connection: dataDoChat["connection"],
              lastTime: dataDoChat["lastTime"],
              total_unread: dataDoChat["total_unread"],
            ));
          });

          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        user.update((user) {
          user!.chats = docChats as List<ChatUser>;
        });

        chat_id = chatsData;
        user.refresh();
      } else {
        // buat baru, mereka berdua benar2 belum ada konneksi
        final newChatDoc = await chats.add({
          "connection": [_currentUser!.email, friendEmail],
        });

        await chats.doc(newChatDoc.id).collection("chat");

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": date,
          "total_unread": 0,
        });

        final listChat =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChat.docs.isNotEmpty) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChat.docs.forEach((element) {
            var dataDoChat = element.data();
            var dataDoChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDoChatId,
              connection: dataDoChat["connection"],
              lastTime: dataDoChat["lastTime"],
              total_unread: dataDoChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chat_id = newChatDoc.id;
        user.refresh();
      }
    }

    Get.toNamed(Routes.DETAIL_CHAT);
  }

  @override
  void onInit() {
    autoLogin();
    super.onInit();
  }

  Future<void> autoLogin() async {
    if (box.read("userData") != null) {
      final data = box.read("userData") as Map<String, dynamic>;
      login(data["email"], data["password"]);
    }
  }

  void login(String email, String password) async {
    try {
      LoginProvider().login(email, password).then(
        (response) {
          if (response["status"] != 200) {
            dialogError(response['messages']);
          } else {
            final data =
                UserCustomer.fromJson(response["data"] as Map<String, dynamic>);
            userCustomer.add(data);
            box.write('userData', {
              "id": response['data']['users']['id'],
              "token": response['data']['token'],
              "email": email,
              "name": response['data']['users']['name'],
              "password": password,
              "customer_id": response['data']['customers']['id'],
            });
            box.write('isAuth', true);
            isAuth.value = true;
            isSkipIntro.value = true;
            cartController.getData();
            notifikasiController.getData();
            Get.back();
            void dialogError(String msg) {
              // Get.defaultDialog(title: "Peringatan", middleText: msg);
              Get.defaultDialog(
                title: "Info",
                titleStyle: TextStyle(fontSize: 12),
                content: Text(
                  response['messages'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              );
            }
          }
          // if (email != '' && password != '') {
          //   if (response['success'] == true) {
          //     box.write('userData', {
          //       "id": response['data']['id'],
          //       "token": response['data']['token'],
          //       "email": email,
          //       "name": response['data']['name'],
          //       "password": password,
          //       "customer_id": response['data']['customer_id'],
          //     });
          //     box.write('isAuth', true);
          //     isAuth.value = true;
          //     isSkipIntro.value = true;
          //     // subscribe();
          //     Get.offAllNamed(Routes.HOME);
          //     _homeController.changeTabIndex(0);
          //     // cartC.photoProduct.clear();
          //     // cartC.cart.clear();
          //     // cartC.getDataPhoto();
          //     // cartC.getData();
          //     // print("login berhasil");
          //   } else {
          //     dialogError('Akun tidak ditemukan');
          //   }
          // } else {
          // dialogError('Semua data input harus di isi');
          // }
        },
      );
    } catch (e) {
      dialogError("Login gagal");
    }
  }

  // subscribe();
  void subscribe() async {
    print("dijalankan");
    final data = box.read("dataUser") as Map<String, dynamic>;
    var topic = "topic_user_id_" + data["id"];
    await FirebaseMessaging.instance.subscribeToTopic(topic);
    // var token = await FirebaseMessaging.instance.getToken();
    // print("ini tokennya = " + token!);
  }

  // void logout() {
  //   final box = GetStorage();
  //   final data = box.read("dataUser") as Map<String, dynamic>;
  //   UserProvider().logout(data["id"], data["token"]).then((response) {
  //     // print(response);
  //     try {
  //       if (response['message'] == 'success') {
  //         if (box.read('dataUser') != null) {
  //           box.erase();
  //         }
  //         isAuth.value = false;
  //         Get.offAllNamed(Routes.HOME);
  //       } else {
  //         dialogError('Logout gagal');
  //       }
  //     } catch (e) {
  //       dialogError('Tidak ada koneksi');
  //     }
  //   });
  // }

  // void getDataCustomer() async {
  //   final data = box.read("userData") as Map<String, dynamic>;
  //   CustomerProvider().getData(data["token"]).then((response) {
  //     try {
  //       response["data"].map((e) {
  //         final data = CustomerModel(
  //           id: e["id"],
  //           userId: UserModel(
  //             id: e["user_id"]["id"],
  //             name: e["user_id"]["name"],
  //           ),
  //           addressId: e["address_id"],
  //           gender: e["gender"],
  //           birth: e["birth"],
  //           telp: e["telp"],
  //           image: e["image"],
  //         );
  //         customer.add(data);
  //       }).toList();
  //       final data = box.read("userData") as Map<String, dynamic>;
  //       box.write('userData', {
  //         "id": data['id'],
  //         "token": data["token"],
  //         "email": data["email"],
  //         "password": data["password"],
  //         "name": data["name"],
  //         "customer_id": findCustomer((data["id"])).id,
  //       });
  //     } catch (e) {
  //       print("Error is : " + e.toString());
  //     }
  //   });
  // }

  // CustomerModel findCustomer(int id) {
  //   return customer.firstWhere((e) => e.userId!.id! == id);
  // }

  // Chat

  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection("chats");
    CollectionReference users = firestore.collection("users");

    final docChats =
        await users.doc(_currentUser!.email).collection("chats").get();

    if (docChats.docs.length != 0) {
      // user sudah pernah chat dengan siapapun
      final checkConnection = await users
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();

      if (checkConnection.docs.length != 0) {
        // sudah pernah buat koneksi dengan => friendEmail
        flagNewConnection = false;

        //chat_id from chats collection
        chat_id = checkConnection.docs[0].id;
      } else {
        // blm pernah buat koneksi dengan => friendEmail
        // buat koneksi ....
        flagNewConnection = true;
      }
    } else {
      // blm pernah chat dengan siapapun
      // buat koneksi ....
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      // cek dari chats collection => connections => mereka berdua...
      final chatsDocs = await chats.where(
        "connections",
        whereIn: [
          [
            _currentUser!.email,
            friendEmail,
          ],
          [
            friendEmail,
            _currentUser!.email,
          ],
        ],
      ).get();

      if (chatsDocs.docs.length != 0) {
        // terdapat data chats (sudah ada koneksi antara mereka berdua)
        final chatDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chat_id = chatDataId;

        user.refresh();
      } else {
        // buat baru , mereka berdua benar2 belum ada koneksi
        final newChatDoc = await chats.add({
          "connections": [
            _currentUser!.email,
            friendEmail,
          ],
        });

        await chats.doc(newChatDoc.id).collection("chat");

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": date,
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chat_id = newChatDoc.id;

        user.refresh();
      }
    }

    print(chat_id);

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: _currentUser!.email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users
        .doc(_currentUser!.email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});

    Get.toNamed(
      Routes.DETAIL_CHAT,
      arguments: {
        "chat_id": "$chat_id",
        "friendEmail": friendEmail,
      },
    );
  }
}
