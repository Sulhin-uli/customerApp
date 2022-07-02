import 'dart:convert';

import 'package:customer_app/app/data/models/order_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PengirimanController extends GetxController {
  AlamatController alamatController = Get.find();
  CartController cartController = Get.find();
  var invoice = List<Order>.empty().obs;

  final box = GetStorage();

  void checkout() {
    final data = box.read("userData") as Map<String, dynamic>;
    CartProvider().postDataOrder(data["id"], data["token"]).then((response) {
      final data = Order(
        id: response["data"]["id"],
        code: response["data"]["code"],
        // userId: response["data"]["user_id"],
        // addressId: response["data"]["address_id"],
        // status: response["data"]["status"],
        // orderDate: response["data"]["order_date"],
        // paymentDue: response["data"]["payment_due"],
        // paymentStatus: response["data"]["payment_status"],
        // paymentToken: response["data"]["payment_token"],
        paymentUrl: response["data"]["payment_url"],
        totalPrice: response["data"]["total_price"],
        // approvedBy: response["data"]["approved_by"],
        // approvedAt: response["data"]["approved_at"],
        // cancelledBy: response["data"]["cancelled_by"],
        // cancelledAt: response["data"]["cancelled_at"],
        // cancellationNote: response["data"]["cancellation_note"],
        // createdAt: response["data"]["created_at"],
        // updatedAt: response["data"]["updated_at"],
        // address: Address(
        //     id: response["data"]["address"]["id"],
        //     userId: response["data"]["address"]["user_id"],
        //     recipientsName: response["data"]["address"]["recipients_name"],
        //     telp: response["data"]["address"]["telp"],
        //     addressLabel: response["data"]["address"]["address_label"],
        //     city: response["data"]["address"]["city"],
        //     postalCode: response["data"]["address"]["postal_code"],
        //     mainAddress: response["data"]["address"]["main_address"],
        //     completeAddress: response["data"]["address"]["complete_address"],
        //     noteForCourier: response["data"]["address"]["note_for_courier"],
        //     createdAt: response["data"]["address"]["created_at"],
        //     updatedAt: response["data"]["address"]["updated_at"]),
        // user: User(
        //   id: response["data"]["user"]["id"],
        //   name: response["data"]["user"]["name"],
        //   email: response["data"]["user"]["email"],
        //   token: response["data"]["user"]["token"],
        //   tokenExpire: response["data"]["user"]["token_expire"],
        //   createdAt: response["data"]["user"]["created_at"],
        //   updatedAt: response["data"]["user"]["updated_at"],
        //   isEmailVerified: response["data"]["user"]["is_email_verified"],
        // ),
        // orderItems: [
        //   OrderItems(
        //     id: response["data"]["order_items"]["id"],
        //     orderId: response["data"]["order_items"]["order_id"],
        //     productId: response["data"]["order_items"]["product_id"],
        //     qty: response["data"]["order_items"]["qty"],
        //     price: response["data"]["order_items"]["price"],
        //     createdAt: response["data"]["order_items"]["created_at"],
        //     updatedAt: response["data"]["order_items"]["updated_at"],
        //   ),
        // ],
      );
      invoice.add(data);
      print(invoice.first.code);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
