import "dart:async";
import 'dart:convert';
import 'package:pharma_off/home/objetos/UserPwdforgotten.dart';
import 'package:http/http.dart' as http;

class APIForgottenPwd {
  Future<Forgottenpwd> forgotPassword(String email) async {
    // String url = "10.0.2.2:3000";
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response = await http.post(
        Uri.http(url, "/usuarios/esqueceuSenha"),
        body: jsonEncode(<String, String>{
          "email": email,
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8"
        });
    if (response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.body}");
      return Forgottenpwd.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      print("${response.statusCode}");
      print("${response.body}");
      return Forgottenpwd.fromJson(json.decode(response.body));
    }
    return null; //throw Exception("Falha no carregamento dos dados!!!!");
  }
}
