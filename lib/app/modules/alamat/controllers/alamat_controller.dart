import 'package:customer_app/app/data/models/address_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/address_provider.dart';
import 'package:customer_app/app/modules/ongkir/controllers/ongkir_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlamatController extends GetxController {
  final box = GetStorage();
  late TextEditingController recipientsName;
  late TextEditingController telp;
  late TextEditingController addressLabel;
  late TextEditingController completeAddress;
  late TextEditingController city;
  late TextEditingController postalCode;
  late TextEditingController mainAddress;
  late TextEditingController noteForCourier;
  var isMain = false.obs;
  var isLoading = true.obs;
  var address = List<AddressModel>.empty().obs;
  OngkirController ongkirController = Get.put(OngkirController());
  var hiddenKota = true.obs;
  var provinsiId = 0.obs;
  var kotaId = 0.obs;
  var hiddenButton = true.obs;

  @override
  void onInit() {
    recipientsName = TextEditingController();
    telp = TextEditingController();
    addressLabel = TextEditingController();
    completeAddress = TextEditingController();
    city = TextEditingController();
    postalCode = TextEditingController();
    mainAddress = TextEditingController();
    noteForCourier = TextEditingController();
    getData();
    super.onInit();
  }

  void showButton() {
    if (kotaId != 0) {
      hiddenButton.value = false;
    } else {
      hiddenButton.value = true;
    }
  }

  // add data
  void postData(
    String recipientsName,
    String telp,
    String addressLabel,
    String completeAddress,
    int postalCode,
    int mainAddress,
    String noteForCourier,
  ) async {
    final data = box.read("userData") as Map<String, dynamic>;
    if (recipientsName != '' &&
        telp != '' &&
        addressLabel != '' &&
        completeAddress != '') {
      AddressProvider()
          .postData(
              data["id"],
              recipientsName,
              telp,
              addressLabel,
              completeAddress,
              provinsiId.value,
              kotaId.value,
              postalCode,
              mainAddress,
              noteForCourier,
              data["token"])
          .then((response) {
        // print(response);
        // final data = AddressModel(
        //   id: response["data"]["id"],
        //   userId: UserModel(
        //     id: response["data"]["user_id"]["id"],
        //     name: response["data"]["user_id"]["name"],
        //   ),
        //   recipientsName: response["data"]["recipients_name"],
        //   telp: response["data"]["telp"],
        //   addressLabel: response["data"]["address_label"],
        //   completeAddress: response["data"]["complete_address"],
        //   provinsiId: response["data"]["provinsi_id"],
        //   kotaId: response["data"]["kota_id"],
        //   postalCode: response["data"]["postal_code"],
        //   mainAddress: response["data"]["main_address"],
        //   noteForCourier: response["data"]["note_for_courier"],
        // );
        final data =
            AddressModel.fromJson(response["data"] as Map<String, dynamic>);
        address.add(data);
        Get.back();
        dialog("Berhasil !", "data berhasil ditambahkan!");
      });
    } else {
      dialog("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }

  /// infinnity scroll
  var page = 1.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  void onRefresh() async {
    address.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    page.value = 1;
    getData();
    refreshController.refreshCompleted();
  }

  void addItems() {
    getData();
  }

  void onLoading() {}

  void getData() async {
    try {
      isLoading(true);
    } finally {
      isLoading(false);
      final data = box.read("userData") as Map<String, dynamic>;
      AddressProvider()
          .getData(data['id'], page.value, data["token"])
          .then((response) {
        try {
          response["data"].map((e) {
            // final data = AddressModel(
            //   id: e["id"],
            //   userId: UserModel(
            //     id: e["user_id"]["id"],
            //     name: e["user_id"]["name"],
            //   ),
            //   recipientsName: e["recipients_name"],
            //   telp: e["telp"],
            //   addressLabel: e["address_label"],
            //   completeAddress: e["complete_address"],
            //   provinsiId: e["provinsi_id"],
            //   kotaId: e["kota_id"],
            //   postalCode: e["postal_code"],
            //   mainAddress: e["main_address"],
            //   noteForCourier: e["note_for_courier"],
            // );
            if (response["data"].length != 0) {
              final data = AddressModel.fromJson(e as Map<String, dynamic>);
              address.add(data);

              for (var e in address) {
                if (e.mainAddress == 1) {
                  var addressMain = e;
                  address.remove(e);
                  address.insert(0, addressMain);
                }
              }
              page.value = page.value + 1;
            } else {}
          }).toList();
        } catch (e) {
          print("Error is : " + e.toString());
        }
      });
    }
  }

  AddressModel findByid(int id) {
    return address.firstWhere((element) => element.id == id);
  }

  void editData(
    int id,
    String recipientsName,
    String telp,
    String addressLabel,
    String completeAddress,
    String city,
    int postalCode,
    int mainAddress,
    String noteForCourier,
  ) {
    final item = findByid(id);
    final data = box.read("userData") as Map<String, dynamic>;
    AddressProvider()
        .updateData(
      id,
      recipientsName,
      telp,
      addressLabel,
      completeAddress,
      provinsiId.value,
      kotaId.value,
      mainAddress,
      postalCode,
      noteForCourier,
      data["token"],
    )
        .then((_) {
      item.recipientsName = recipientsName;
      item.telp = telp;
      item.addressLabel = addressLabel;
      item.completeAddress = completeAddress;
      item.provinsiId = provinsiId.value;
      item.kotaId = kotaId.value;
      item.postalCode = postalCode;
      item.mainAddress = mainAddress;
      item.noteForCourier = noteForCourier;
      address.refresh();
      Get.back();
      dialog("Berhasil !", "data berhasil diubah");
    });
  }

  void editMainAddress(
    int id,
    int mainAddress,
  ) {
    for (var e in address) {
      if (e.mainAddress == 1) {
        e.mainAddress = 0;
        address.refresh();
      }
    }
    final item = findByid(id);
    final data = box.read("userData") as Map<String, dynamic>;
    AddressProvider()
        .updateMainAddress(id, data["id"], mainAddress, data["token"])
        .then((response) {
      item.mainAddress = mainAddress;
      address.refresh();
      for (var e in address) {
        if (e.mainAddress == 1) {
          var addressMain = e;
          address.remove(e);
          address.insert(0, addressMain);
        }
      }
      Get.back();
    });
  }

  void deleteData(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    AddressProvider()
        .deleteData(id, data["token"])
        .then((_) => address.removeWhere((element) => element.id == id));
    // Get.back();
    dialog("Berhasil !", "data berhasil dihapus!");
  }

  void dialogQuestion(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Peringatan"),
        content: const Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              deleteData(id);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void moreQuestion(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: InkWell(
            onTap: () => Get.back(),
            child: Text(
              "X",
              style: TextStyle(color: Colors.grey),
            )),
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  editMainAddress(id, 1);
                },
                child: const Text(
                  'Jadikan Alamat Utama & Pilih',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  dialogQuestion(context, id);
                },
                child: const Text(
                  'Hapus Alamat',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
