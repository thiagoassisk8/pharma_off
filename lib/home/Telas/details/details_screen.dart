import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import '../../objetos/produto.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final Produto product;

  ProductDetailsArguments({@required this.product});
}
