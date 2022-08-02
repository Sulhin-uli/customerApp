import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReviewProvider extends GetConnect {
  @override
  String url = baseUrl + "review";

  Future<dynamic> getData() async {
    final response = await get(url + '_public');
    return response.body;
  }

  Future<dynamic> postData(int? userId, int orderId, int productId,
      String starsRated, String review, String? token) async {
    final response = await post(url, {
      "user_id": userId,
      "order_id": orderId,
      "product_id": productId,
      "stars_rated": starsRated,
      "review": review,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> starRated(int? productId) async {
    final response = await get(baseUrl + "star_rated/$productId");
    return response.body;
  }
}
