import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaOfertas.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';
import 'package:pharma_off/home/servicos/app_clipper.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'package:pharma_off/home/objetos/Cart.dart';
import 'dart:math' as math;
import 'package:flutter/src/material/snack_bar.dart';
import 'package:pharma_off/palheta/theme.dart';

void AddnoCarrinho(product) {
  listaCarrinho.add(Cart(produto: product, numDeItem: 1));
  print(listaCarrinho);
}

class DetailPage2 extends StatefulWidget {
  final Data produto;
  DetailPage2(this.produto);
  static String NomeNavegacao = "/detalhe";
  @override
  _detailState createState() => _detailState();
}

class _detailState extends State<DetailPage2> {
  List produtosData;
  List ofertasData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AzulPrimario,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AzulPrimario,
        elevation: 0,
        centerTitle: true,
        title: Text("Produto",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: buildList(),
      ),
    );
  }

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
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .75,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: AppClipper(
                      cornerSize: 50,
                      diagonalHeight: 180,
                      roundedBottom: false,
                    ),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 180, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Text(
                              // 'Teste',
                              "${widget.produto.name}",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildRating(),
                          SizedBox(height: 10),
                          Text(
                            "Detalhes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${widget.produto.desc}",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: _buildBottom(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 115),

                child: Transform.rotate(
                  angle: -math.pi / 20,
                  child: Image(
                    width: MediaQuery.of(context).size.width * .60,
                    image:
                        AssetImage("assets/images/${widget.produto.imgPath}"),
                  ),
                ),
                // ),
              ),
            ],
          ),
        );
      });
  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Preço",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                "R\$ ${widget.produto.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ],
          ),
          Container(
            child: FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              child: Text('Adicionar ao carrinho'),
              onPressed: () {
                AddnoCarrinho(widget.produto);
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Adicionado ao Carrinho!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.green[600],
                  action: SnackBarAction(
                    label: "Action",
                    onPressed: () {

                    },
                  ),
                ),
              );

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[
        // RatingBar(
        //   initialRating: 3,
        //   minRating: 1,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemSize: 20,
        //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        // itemBuilder: (context, _) => Icon(
        //   Icons.star,
        //   color: Colors.amber,
        // ),
        // onRatingUpdate: (rating) {
        //   print(rating);
        // },
        // ),
        SizedBox(width: 16),
        Text(
          "10 Reviews",
          style: TextStyle(
            color: Colors.black26,
          ),
        )
      ],
    );
  }
}
