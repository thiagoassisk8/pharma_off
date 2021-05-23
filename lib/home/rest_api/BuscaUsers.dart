import "dart:async";
import 'dart:convert';
import 'package:pharma_off/home/objetos/User.dart';
import 'package:http/http.dart' as http;

class APIGetUsers {
  Future<User> getAllUsers() async {
    // String url = "localhost:3000";
    String url = "rest-api-pharmaoff.herokuapp.com";

    final http.Response response = await http.get(Uri.http(url, "/usuarios"));

    if (response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.body}");
      return User.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return User.fromJson(json.decode(response.body));
    }
    return null;
  }
}
