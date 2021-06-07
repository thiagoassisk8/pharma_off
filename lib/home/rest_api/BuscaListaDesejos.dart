import "dart:async";
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_off/home/servicos/ComplementosServicos.dart';

// String url = "localhost:3000";
class APIGetListaDesejos {
  Future<Produto> getAllProdutosUser() async {
    // var cod_user = Complemento().saveDataUser(userLogged);
    var cod_user;
    String url = "rest-pharmaoff.herokuapp.com";

    final http.Response response =
        await http.get(Uri.http(url, "/listadesejos/${cod_user}"));
    if (response.statusCode == 200) {
      print("Status code: ${response.statusCode}");
      print("Produtos da API do usuário: ${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print("${response.statusCode}");
      print("${response.body}");
      // return Produto.fromJson(json.decode(response.body));
    }
    return null;
  }
}
