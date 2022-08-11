import 'package:customer_app/app/data/models/notification_blade.dart';
import 'package:customer_app/app/data/providers/notification_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotifikasiController extends GetxController {
  var isLoading = true.obs;
  var notif = List<Notification>.empty().obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void getData() async {
    try {
      isLoading(true);
    } finally {
      isLoading(false);
      final data = box.read("userData") as Map<String, dynamic>;
      var userId = data["id"];
      NotificationProvider().getData(userId, data["token"]).then((response) {
        response["data"].map((e) {
          final data = Notification.fromJson(e as Map<String, dynamic>);
          notif.add(data);
        }).toList();
      });
    }
  }

  Notification findByid(int id) {
    return notif.firstWhere((element) => element.id == id);
  }

  void readAll() async {
    final data = box.read("userData") as Map<String, dynamic>;
    NotificationProvider()
        .deleteAll(data["token"], data["id"])
        .then((response) {
      notif.clear();
      getData();
    });
  }
}
