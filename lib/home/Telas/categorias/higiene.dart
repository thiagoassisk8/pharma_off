import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/Detalhes_produtosON.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaHigiene.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'dart:math' as math;

class Higiene extends StatefulWidget {
  const Higiene({Key key}) : super(key: key);
  static String NomeNavegacao = "/higiene";
  @override
  _HigieneState createState() => _HigieneState();
}

class _HigieneState extends State<Higiene> {
  List higieneData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getProdutosHigiene() async {
    var listProdutosHigiene = await APIGetHigiene().getAllHigieneprods();

    higieneData = [];
    for (var produto in listProdutosHigiene.data) {
      higieneData.add(produto);
    }
    return higieneData;
  }

  Widget buildList() => FutureBuilder(
      future: getProdutosHigiene(),
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Text(
                          // "Categorias",
                          // style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          // fontSize: 32,
                          // ),
                          // ),
                          IconButton(
                            icon: Icon(FlutterIcons.search,
                                color: Colors.black26),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: ListView.builder(
                        itemCount: higieneData.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailPage2(
                                    higieneData[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 240,
                              margin: EdgeInsets.only(right: 16),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    // child: _buildBackground(index, 230),
                                  ),
                                  Positioned(
                                    bottom: 50,
                                    right: 0,
                                    // child:
                                    //  Hero(

                                    // tag: "hero${higieneData[index].imgPath}",
                                    child: Transform.rotate(
                                      angle: -math.pi / 27,
                                      child: Image(
                                        width: 220,
                                        image: AssetImage(
                                           "assets/images/${higieneData[index].imgPath}"),
                                      ),
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "SÓ PARA VOCÊ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    ...higieneData.map((data) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage2(
                                data,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin:
                          EdgeInsets.only(left: 16, right: 16, bottom: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Image(
                                image:
                                AssetImage("assets/images/${data.imgPath}"),
                                width: 80,
                                height: 60,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Text(
                                        "${data.name}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    // "${data.estabelecimento}",
                                    // style: TextStyle(
                                    // color: Colors.black26,
                                    // height: 1.5,
                                    // ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  "R\$ ${data.price.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
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
        title: Text("Higiene",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: buildList(),
      ),
    );
  }
}
