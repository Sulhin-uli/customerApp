import 'package:customer_app/app/data/providers/customer_provider.dart';
import 'package:customer_app/app/data/providers/user_provider.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SayaController extends GetxController {
  final box = GetStorage();
  late TextEditingController gender;
  late TextEditingController birth;
  late TextEditingController telp;
  late TextEditingController passwordCurrent;
  late TextEditingController passwordNew;
  late TextEditingController passwordConfirm;
  var hiddenTextPasswordCurrent = true.obs;
  var hiddenTextPasswordNew = true.obs;
  var hiddenTextPasswordConfirm = true.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  final homeC = Get.put(HomeController());
  final cartC = Get.put(CartController());

  @override
  void onInit() {
    gender = TextEditingController();
    birth = TextEditingController();
    telp = TextEditingController();
    passwordCurrent = TextEditingController();
    passwordNew = TextEditingController();
    passwordConfirm = TextEditingController();
    super.onInit();
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = " Mb";
      updateImage(selectedImagePath.value);
    } else {
      Get.snackbar(
        "Warning",
        "No image Selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateImage(
    String image,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    Map<String, String> body = {"id": data["customer_id"].toString()};
    CustomerProvider().updateImage(body, image, data["token"]).then((response) {
      // print(response);
    });
  }

  void editData(
    String gender,
    String birth,
    String telp,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    CustomerProvider()
        .updateData(data["customer_id"], gender, birth, telp, data["token"])
        .then((_) {
      dialog("Berhasil !", "data berhasil diubah");
      Get.back();
    });
  }

  void dialogQuestion(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Logout"),
        content: Text("Apakah yakin akan logout?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              box.erase();
              box.write('isAuth', false);
              homeC.changeTabIndex(0);
              cartC.cart.clear();
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void editPassword(
    String passwordCurrent,
    String passwordNew,
    String passwordConfirm,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    if (passwordCurrent != '' && passwordNew != '' && passwordConfirm != '') {
      if (passwordCurrent != data["password"]) {
        dialogNoBack("Terjadi Kesalahan !", "Password saat ini salah");
      } else {
        if (passwordNew == passwordConfirm) {
          final data = box.read("userData") as Map<String, dynamic>;
          UserProvider()
              .updateData(data["id"], passwordNew, data["token"])
              .then((response) {
            final data = box.read("userData") as Map<String, dynamic>;
            box.write('userData', {
              "id": data['id'],
              "token": data["token"],
              "email": data["email"],
              "name": data["name"],
              "password": passwordNew,
              "customer_id": data["customer_id"],
            });
            Get.back();
            dialog("Berhasil !", "data berhasil diubah");
          });
        } else {
          dialogNoBack("Terjadi Kesalahan !", "Konfirmasi password tidak sama");
        }
      }
    } else {
      dialogNoBack("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }
}
