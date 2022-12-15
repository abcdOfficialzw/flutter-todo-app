import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:todo/constants/app_urls.dart';
import 'package:todo/ui/authentication/signup_form.dart';

class NetworkingService {
  static Future<Map<String, dynamic>> signin(
    String username,
    String password,
  ) async {
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
//Sign Up

  static Future<Map<String, dynamic>> signup(String firstname, String lastname,
      String username, String email, String password) async {
    Map<String, dynamic> data = {};
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('${AppUrls.baseAuthUrl}${AppUrls.signUpEndpoint}'));
    request.body = json.encode({
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": email,
      "password": password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    data["status"] = response.statusCode;
    data["response"] = response.reasonPhrase;
    data["content"] = await response.stream.bytesToString();

    print(data);

    return data;
  }

  static String hashPassword(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }

  static Future<Map<String, dynamic>> getPinnedTasks(
      {required int assigneeId}) async {
    Map<String, dynamic> data = {};

    var request = http.Request(
        'GET',
        Uri.parse(
            '${AppUrls.baseTaskUrl}${AppUrls.getPinnedTasks}/${assigneeId.toString()}'));

    http.StreamedResponse response = await request.send();

    data["status"] = response.statusCode;
    data["response"] = response.reasonPhrase;
    data["content"] = await response.stream.bytesToString();
    data["content"] = json.decode(data["content"]);

    print('=>$data');

    return data;
  }
}
