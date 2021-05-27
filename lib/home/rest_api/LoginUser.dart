import "dart:async";
import 'dart:convert';
import '../objetos/loginmodel.dart';
import 'package:http/http.dart' as http;

class APILogin {
  Future<LoginResponseModel> login(String email, String senha) async {
    String url = "10.0.2.2:3000";
    // String url = "rest-api-pharmaoff.herokuapp.com";

    final http.Response response = await http.post(
        Uri.http(url, "/usuarios/login"),
        body: jsonEncode(<String, String>{
          "email_pessoa": email,
          "pwd_pessoa": senha,
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8"
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
    // throw Exception("Erro no carregamento dos dados");
  }
}
