import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/components/product_card.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';

import 'package:pharma_off/palheta/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
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
    // future:
    // getProdutos();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
              // buildList(),
              ...List.generate(
                LocalHost.LocalHostlist.length,
                (index) {
                  if (LocalHost.LocalHostlist[index].isPopular)
                    return ProductCard(product: LocalHost.LocalHostlist[index]);
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
  }
}
