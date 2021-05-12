import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/Cart.dart';
import 'package:pharma_off/home/Telas/cart/componentes/body.dart';
import 'package:pharma_off/home/Telas/cart/componentes/check_out_card.dart';
import 'package:pharma_off/palheta/theme.dart';



class desejos extends StatelessWidget {
  static String NomeNavegacao = "/desejos";

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
      title: Row(
        children: [
          Text(
            "Lista de Desejos", textScaleFactor: 1, style: TextStyle(color: AzulPrimario,fontWeight: FontWeight.bold),

          ),
          Padding(padding: EdgeInsets.fromLTRB(80, 0, 0, 0)),
          Text(
            "${listaCarrinho.length} itens",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
