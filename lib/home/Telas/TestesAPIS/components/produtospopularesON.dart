import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/TesteCatalogo.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/components/Product_cardON.dart';
import 'package:pharma_off/home/Telas/catalogo/home/components/section_title.dart';
import 'package:pharma_off/home/Telas/catalogo/home/components/product_card.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';

import 'package:pharma_off/palheta/size_config.dart';

class PopularProducts2 extends StatelessWidget {
  List produtosData;
  @override
  Future getProdutos() async {
    var listProdutos = await APIGetProdutos().getAllProdutos();
    produtosData = [];
    for (var produto in listProdutos.data) {
      produtosData.add(produto);
    }
    return produtosData;
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget buildList() => FutureBuilder(
      future: getProdutos(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                  title: "Produtos",
                  press: () {
                    getProdutos();
                  }),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    // buildList(),
                    shrinkWrap: true,
                    itemCount: produtosData.length,
                    itemBuilder: (context, index) {
                      print(produtosData[index].isPopular);
                      if (produtosData[index].isPopular)
                        return ProductCard2(produto: produtosData[index]);
                      return SizedBox.shrink();

                      // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            )
          ],
        );
      });
}
