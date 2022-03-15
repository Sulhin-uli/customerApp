import 'package:get/get.dart';

import '../controllers/pengiriman_controller.dart';

class PengirimanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengirimanController>(
      () => PengirimanController(),
    );
  }
}
