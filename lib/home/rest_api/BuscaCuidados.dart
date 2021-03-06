import "dart:async";
import 'dart:convert';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:http/http.dart' as http;

// String url = "localhost:3000";
class APIGetCuidado {
  Future<Produto> getAllCuidadoprods() async {
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response =
        await http.get(Uri.http(url, "/produtos/cuidado"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Produtos de Cuidado Pele e Cabelo da API: ${response.body}");
      return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }
}
