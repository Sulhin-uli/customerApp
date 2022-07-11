import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class EditProfileView extends GetView<SayaController> {
  final authC = Get.find<AuthController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    final data = controller.customer.first;
    data.gender != null
        ? controller.gender.text = data.gender!
        : controller.gender.text;
    data.birth != null
        ? controller.birth.text = DateFormat('yyyy-MM-dd')
            .format(DateTime.tryParse(data.birth!.toString())!)
        : controller.birth.text;
    data.telp != null
        ? controller.telp.text = data.telp!.toString()
        : controller.telp.text;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Edit Akun',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jenis Kelamin",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Container(
                // padding: EdgeInsets.all(16),
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  // showSelectedItems: true,
                  items: ["Laki-laki", 'Perempuan'],
                  maxHeight: 120,
                  onChanged: (e) {
                    controller.gender.text = e!;
                  },
                  dropdownSearchDecoration: const InputDecoration(
                    labelText: "",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    // border: border,
                  ),
                  selectedItem: data.gender,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Tanggal Lahir",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.birth,
                readOnly: true,
                cursorColor: const Color(0xff16A085),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    controller.birth.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.date_range_rounded,
                    color: Color(0xff919A92),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Telepon",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.telp,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.editData(
                      controller.gender.text,
                      controller.birth.text,
                      controller.telp.text,
                    ),
                    child: const Text('Edit'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
