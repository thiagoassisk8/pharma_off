import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/constants.dart';
import 'package:pharma_off/palheta/size_config.dart';

class Pesquisa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return pesquisa();
  }
}

class pesquisa extends State<Pesquisa>{
  static String NomeNavegacao = "/pesquisa";
  @override
  String filterText = "";
  Widget build(BuildContext context) {

    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (text) {
        setState(() {
        filterText = text;
      });
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Procurar produto",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }


}
