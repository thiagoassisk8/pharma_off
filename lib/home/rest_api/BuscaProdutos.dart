import "dart:async";
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:http/http.dart' as http;

class APIGetProdutos {
  Future<Produto> getAllProdutos() async {
    String url = "localhost:3000";
    // String url = "rest-api-pharmaoff.herokuapp.com";

    final http.Response response = await http.get(Uri.http(url, "/produtos"));
    if (response.statusCode == 200) {
      print("[DEBUG API]: ${response.statusCode}");
      print("[DEBUG API]: ${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }
}
