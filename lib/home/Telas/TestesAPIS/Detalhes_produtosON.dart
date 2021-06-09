import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaOfertas.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'dart:math' as math;

class HomeProdutos extends StatefulWidget {
  const HomeProdutos({Key key}) : super(key: key);
  static String NomeNavegacao = "/teste";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeProdutos> {
  List produtosData;
  List ofertasData;

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

  Future getOfertas() async {
    var listOfertas = await APIGetOfertas().getAllOfertas();
    ofertasData = [];
    for (var oferta in listOfertas.data) {
      ofertasData.add(oferta);
    }
    return ofertasData;
  }

  Widget buildList() => FutureBuilder(
      future: getProdutos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              // width: 200.0,
              // height: 200.0,
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
              return Container(
                // width: 240,
                margin: EdgeInsets.only(right: 16),
                child: Column(children: <Widget>[]),
              );
              // );
              // },
              // );
            }
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Teste tela PRODUTOS",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: buildList(),
      ),
    );
  }
}
