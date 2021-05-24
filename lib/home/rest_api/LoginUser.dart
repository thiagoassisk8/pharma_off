import 'package:pharma_off/home/objetos/JsonDefault.dart';
import "dart:async";
import 'dart:convert';
import 'package:http/http.dart' as http;

class APILogin {
  Future<JsonDefault> login(String email_pessoa, String pwd_pessoa) async {
    String url = "127.0.0.1:3000";
    // String url = "rest-api-pharmaoff.herokuapp.com";

    final http.Response response = await http.post(
        Uri.http(url, "/usuarios/login"),
        body: jsonEncode(<String, String>{
          "email_pessoa": email_pessoa,
          "pwd_pessoa": pwd_pessoa,
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8"
        });
    if (response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    }
    // throw Exception("Erro no carregamento dos dados");
  }
}
