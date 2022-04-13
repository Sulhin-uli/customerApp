import 'package:get/get.dart';

import 'package:customer_app/app/modules/login/controllers/authcontroller_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthcontrollerController>(
      () => AuthcontrollerController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
