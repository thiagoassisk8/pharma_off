import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_off/palheta/size_config.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/home/Telas/categorias/promocoes.dart';
import 'package:pharma_off/home/Telas/categorias/higiene.dart';
import 'package:pharma_off/home/Telas/categorias/remedios.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Rémedios"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Higiene"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Ofertas"},

    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              if (index == 0) {
                Navigator.pushNamed(context, Remedios.NomeNavegacao);
              }
              else if (index == 1) {
                Navigator.pushNamed(context, Higiene.NomeNavegacao);
              }
              else if(index ==2){
                Navigator.pushNamed(context, Promocoes.NomeNavegacao);
              }
                },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(85),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(65),
              width: getProportionateScreenWidth(185),
              decoration: BoxDecoration(
                color: AzulPrimario,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
