import "dart:async";
import 'dart:convert';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:http/http.dart' as http;

// String url = "localhost:3000";
class APIGetProdutos {
  Future<Produto> getAllProdutos() async {
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response = await http.get(Uri.http(url, "/produtos"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Produtos da API: ${response.body}");

      // print(Produto.fromJson(json.decode(response.body);
      return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }

  Future<Produto> getAllOfertas() async {
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response =
        await http.get(Uri.http(url, "/produtos/ofertas"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Ofertas da API: ${response.body}");
      return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }

  Future<Produto> getAllPopularProdutos() async {
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response =
        await http.get(Uri.http(url, "/produtos/populares"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Produtos da API: ${response.body}");

      // print(Produto.fromJson(json.decode(response.body);
      return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }
}
