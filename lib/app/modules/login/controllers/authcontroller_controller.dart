import 'package:customer_app/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';

class AuthcontrollerController extends GetxController {
  var isAuth = false.obs;

  // Map<String, String> _dataUser = {'nik': '123456789', 'pin': '123456789'};

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  @override
  void onInit() {
    super.onInit();
  }

  // Future<void> autoLogin() async {
  //   final box = GetStorage();
  //   bool route = false;
  //   if (box.read("dataUser") != null) {
  //     final data = box.read("dataUser") as Map<String, dynamic>;
  //     login(data["nik"], data["pin"], route);
  //   }
  // }

  void login(String email, String password) async {
    LoginProvider().login(email, password).then(
      (response) {
        if (email != '' && password != '') {
          dialogError('Login Success');
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
}
