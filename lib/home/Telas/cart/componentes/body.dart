import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_off/home/objetos/Cart.dart';
import 'package:pharma_off/palheta/size_config.dart';

//import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: listaCarrinho.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(listaCarrinho[index].produto.name.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                listaCarrinho.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: listaCarrinho[index]),
          ),
        ),
      ),
    );
  }
}
