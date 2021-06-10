import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
// import 'package:mercadopago_sdk/mercadopago_sdk.dart';

// //class CartOFF {
//   final LocalHost produto;
//   final int numDeItem;
//
//   CartOFF({@required this.produto, @required this.numDeItem});
// }
//
// // Demo data for our cart
//
// List<CartOFF> listaCarrinhoOff = [
//   // CartOFF(produto: LocalHost.higienelist[0], numDeItem: 2),
//   // CartOFF(produto: LocalHost.pelelist[1], numDeItem: 1),
// ];

class Cart {
  final Data produto;
  final int numDeItem;

  Cart({@required this.produto, @required this.numDeItem});
}

// Demo data for our cart

List<Cart> listaCarrinho = [
  // Cart(produto: Produto.list[0], numDeItem: 2),
  // Cart(produto: Produto.list[1], numDeItem: 1),
];
