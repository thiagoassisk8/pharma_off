import 'package:pharma_off/home/objetos/JsonDefault.dart';
import "dart:async";
import 'dart:convert';
import 'package:http/http.dart' as http;

class APISingUp {
  Future<JsonDefault> singUp(
      String nme_pessoa, String email_pessoa, String pwd_pessoa) async {
    // String url = "localhost:3000";
    String url = "rest-api-pharmaoff.herokuapp.com";
    final http.Response response = await http.post(
        Uri.http(url, "/usuarios/cadastro"),
        body: jsonEncode(<String, dynamic>{
          "nme_pessoa": nme_pessoa,
          "email_pessoa": email_pessoa,
          "pwd_pessoa": pwd_pessoa
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8"
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else if (response.statusCode == 500) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else {
      print("FAIL: ${response.statusCode}");
      print("FAIL: ${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    }
  }
}
