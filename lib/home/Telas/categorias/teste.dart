import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  static String NomeNavegacao = "/teste";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List produtosData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getProdutos() async {
    var listProdutos = await APIGetProdutos().getAllProdutos();
    produtosData = [];
    for (var produto in listProdutos.data) {
      produtosData.add(produto);
    }
    return produtosData;
  }

  Widget buildList() => FutureBuilder(
      future: getProdutos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 5.0,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text("Erro ao carregar..."));
            } else {
              return ListView.builder(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                shrinkWrap: true,
                itemCount: produtosData.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(produtosData[index].name),
                      ],
                    ),
                    // ),
                  );
                },
              );
            }
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste api"),
      ),
      body: Center(
        child: buildList(),
      ),
    );
  }
}
