import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/servicos/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pharma_off/home/objetos/Cart.dart';
import 'package:pharma_off/palheta/theme.dart';

void AddnoCarrinho(product) {
  listaCarrinho.add(Cart(produto: product, numDeItem: 1));
  print(listaCarrinho);
}

class DetailPage extends StatefulWidget {
  static String NomeNavegacao = "/detailpage";
  final LocalHost produto;
  DetailPage(this.produto);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map checkpriceonsale(isonsale) {
    return isonsale;
    // var ofertas = APIGetOfertas.getAllOfertas();
    // if (isonsale == true) {
    // preco = [newprice];
    // return preco;
    // } else if (isonsale == false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AzulPrimario,
      appBar: AppBar(
        backgroundColor: AzulPrimario,
        elevation: 0,
        centerTitle: true,
        title: Text("Produto",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
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
                        // SizedBox(height: 24),
                        // Text(
                        // "COLOR OPTIONS",
                        // style: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 18,
                        // ),
                        // ),
                        // SizedBox(height: 16),
                        // Row(
                        // children: <Widget>[
                        //   _buildColorOption(AppColors.blueColor),
                        //   _buildColorOption(AppColors.greenColor),
                        //   _buildColorOption(AppColors.orangeColor),
                        //   _buildColorOption(AppColors.redColor),
                        // ],
                        // )
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
              padding: const EdgeInsets.only(left: 70, top: 30),
              child: Hero(
                tag: "hero${widget.produto.imgPath}",
                child: Transform.rotate(
                  angle: -math.pi / 20,
                  child: Image(
                    width: MediaQuery.of(context).size.width * .60,
                    image:
                        AssetImage("assets/images/${widget.produto.imgPath}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                "R\$ ${widget.produto.price.toDouble()}",
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
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildColorOption(Color color) {
  //   return Container(
  //     width: 20,
  //     height: 20,
  //     margin: EdgeInsets.only(right: 8),
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(50),
  //       ),
  //     ),
  //   );
  // }

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
