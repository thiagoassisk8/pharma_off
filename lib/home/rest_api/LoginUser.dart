import 'package:pharma_off/home/objetos/JsonDefault.dart';
import "dart:async";
import 'dart:convert';
import 'package:http/http.dart' as http;

class APILogin {
  Future<JsonDefault> login(String emailUsuario, String pwdUsuario) async {
    // String url = "10.0.2.2:3000";
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response = await http.post(
        Uri.http(url, "/usuarios/login"),
        body: jsonEncode(<String, String>{
          "email_usuario": emailUsuario,
          "pwd_usuario": pwdUsuario,
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
    return null;
    // throw Exception("Erro no carregamento dos dados");
  }
}
