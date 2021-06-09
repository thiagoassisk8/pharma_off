import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/Cart.dart';
import 'package:pharma_off/home/Telas/cart/componentes/body.dart';
import 'package:pharma_off/home/Telas/cart/componentes/check_out_card.dart';

import '../../objetos/Cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${listaCarrinhoOff.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
