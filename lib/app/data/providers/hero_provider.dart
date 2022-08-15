import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HeroProvider extends GetConnect {
  @override
  String url = baseUrl + "hero";

  Future<dynamic> getData() async {
    final response = await get('$url');
    return response.body;
  }
}
