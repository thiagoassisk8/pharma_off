import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
// import 'package:mercadopago_sdk/mercadopago_sdk.dart';

class Cart {
  final Produto produto;
  final int numDeItem;

  Cart({@required this.produto, @required this.numDeItem});
}

// Demo data for our cart

List<Cart> listaCarrinho = [
  // Cart(produto: Produto.list[0], numDeItem: 2),
  // Cart(produto: Produto.list[1], numDeItem: 1),
];
