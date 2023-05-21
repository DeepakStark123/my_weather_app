import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/utils/app_url.dart';

class ApiCalls {
  static Future<dynamic> getWhtherInfoByCity({required String city}) async {
    try {
      final response = await http.get(Uri.parse(
          "${AppUrls.baseUrl}weather?q=$city&appid=${AppUrls.myWeatherApiKey}"));
      var data = json.decode(response.body);
      log("Resp: $data");
      return data;
    } catch (e) {
      log("Error: $e");
    }
  }
}
