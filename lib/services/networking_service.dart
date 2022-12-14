import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class NetworkingService {
  static signin(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.10.45:8084/api/auth/signin'));
    request.body =
        json.encode({"username": username, "password": hashPassword(password)});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var userdata = await response.stream.bytesToString();
      return userdata;
    } else {
      return {"status": response.statusCode, "response": response.reasonPhrase};
    }
  }

  static signup() {}

  static String hashPassword(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }
}
