import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/components/product_card.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/rest_api/BuscaProdutos.dart';

import 'package:pharma_off/palheta/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Produtos", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
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
