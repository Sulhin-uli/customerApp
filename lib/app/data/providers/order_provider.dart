import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Order.fromJson(map);
      if (map is List) return map.map((item) => Order.fromJson(item)).toList();
    };
    httpClient.baseUrl = baseUrl;
  }

  Future<Order?> getOrder(int id) async {
    final response = await get('order/$id');
    return response.body;
  }

  Future<Response<Order>> postOrder(Order order) async =>
      await post('cart/shipment/place-order', order);

  Future<Response> deleteOrder(int id) async => await delete('order/$id');
}
