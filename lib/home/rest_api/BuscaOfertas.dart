import "dart:async";
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:http/http.dart' as http;

// String url = "localhost:3000";
class APIGetOfertas {
  Future<Produto> getAllOfertas() async {
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response =
        await http.get(Uri.http(url, "/produtos/ofertas"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Ofertas da API: ${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }
}
