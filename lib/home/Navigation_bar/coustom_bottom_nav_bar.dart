import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/promocoes.dart';


import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/Telas/cupons.dart';
import 'package:pharma_off/home/home_screen.dart';



enum MenuState { home, favorite, message, profile }

class CustomBottomNavBar extends StatelessWidget {


  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: Colors.black,
                ),
                onPressed: () =>
                   Navigator.pushNamed(context, promocoes.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                  color: Colors.black87,
                ),
                onPressed: () =>
                Navigator.pushNamed(context, desejos.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Location point.svg",
                  color: Colors.blueAccent,
                  height: 105,
                ),
                onPressed: ()=>Navigator.pushNamed(context, HomeScreen.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Bill Icon.svg",
                  color: Colors.black,
                ),
                onPressed: ()=>
                    Navigator.pushNamed(context, Cupons.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/suporte-tecnico.svg",
                  color: Colors.black,
                ),
                onPressed: ()=>Navigator.pushNamed(context, formulario.NomeNavegacao),
              ),
            ],
          )),
    );
  }
}
