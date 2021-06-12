import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';
import 'package:flutter/material.dart';

class HomeCatalogo extends StatefulWidget {
  const HomeCatalogo({Key key}) : super(key: key);
  static String NomeNavegacao = "/catalogoTeste";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeCatalogo> {
  List produtosData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getProdutos() async {
    var listProdutos = await APIGetProdutos().getAllPopularProdutos();
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
                    // padding: EdgeInsets.only(
                    // bottom: 15, right: 10, left: 10, top: 5),
                    // height: 180,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(produtosData[index].price),
                        ],
                      ),
                    ),
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
