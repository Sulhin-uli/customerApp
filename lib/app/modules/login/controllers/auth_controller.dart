import 'package:customer_app/app/data/models/customer_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/customer_provider.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/login/providers/login_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  var customer = List<CustomerModel>.empty().obs;

  HomeController _homeController = HomeController();
  CartController cartController = Get.put(CartController());

  // GoogleSignIn _googleSignIn = new GoogleSignIn();

  // // Future<void> googleLogin() async {
  // //   try {
  // //     await _googleSignIn.signIn();
  // //   } catch (error) {
  // //     print(error);
  // //   }
  // // }

  void dialogError(String msg) {
    Get.defaultDialog(title: "Peringatan", middleText: msg);
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
    LoginProvider().login(email, password).then(
      (response) {
        if (email != '' && password != '') {
          if (response['success'] == true) {
            box.write('userData', {
              "id": response['data']['id'],
              "token": response['data']['token'],
              "email": email,
              "name": response['data']['name'],
              "password": password
            });
            box.write('isAuth', true);
            isAuth.value = true;
            isSkipIntro.value = true;
            getDataCustomer();
            Get.offAllNamed(Routes.HOME);
            _homeController.changeTabIndex(0);
            cartController.getData();
          } else {
            dialogError('Akun tidak ditemukan');
          }
        } else {
          dialogError('Semua data input harus di isi');
        }
      },
    );
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

  void getDataCustomer() async {
    final data = box.read("userData") as Map<String, dynamic>;
    CustomerProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          final data = CustomerModel(
            id: e["id"],
            userId: UserModel(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            addressId: e["address_id"],
            gender: e["gender"],
            birth: e["birth"],
            telp: e["telp"],
            image: e["image"],
          );
          customer.add(data);
        }).toList();
        final data = box.read("userData") as Map<String, dynamic>;
        box.write('userData', {
          "id": data['id'],
          "token": data["token"],
          "email": data["email"],
          "password": data["password"],
          "name": data["name"],
          "customer_id": findCustomer((data["id"])).id,
        });
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  CustomerModel findCustomer(int id) {
    return customer.firstWhere((e) => e.userId!.id! == id);
  }
}
