import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:todo/constants/app_urls.dart';

class NetworkingService {
  static Future<Map<String, dynamic>> signin(
      String username, String password) async {
    Map<String, dynamic> data = {};
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('${AppUrls.baseAuthUrl}${AppUrls.signInEndpoint}'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    data["status"] = response.statusCode;
    data["response"] = response.reasonPhrase;
    data["content"] = await response.stream.bytesToString();

    print(data);

    return data;
  }

  static signup() {}

  static String hashPassword(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }
}
