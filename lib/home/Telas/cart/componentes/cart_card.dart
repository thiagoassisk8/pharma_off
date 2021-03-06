import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/palheta/size_config.dart';
import 'package:pharma_off/home/objetos/Cart.dart';
import 'package:pharma_off/home/objetos/produto.dart';
// import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/images/${cart.produto.imgPath}",
                  fit: BoxFit.cover),
            ),
          ),
        ),
        // ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.produto.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "R\$${cart.produto.price}",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: AzulPrimario),
                children: [
                  TextSpan(
                      text: " x${cart.numDeItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
