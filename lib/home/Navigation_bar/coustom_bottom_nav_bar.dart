import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/TesteCatalogo.dart';
import 'package:pharma_off/home/Telas/catalogo/home/home_screen.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/promoOn.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/todosprodutosON.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/categorias/promo.dart';
import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/home/Telas/Register/profile/profile_screen.dart';
import 'package:pharma_off/home/servicos/ComplementosServicos.dart';

// var listUsers = await APIGetUsers().getAllUsers();
// var usuarios = listUsers.data;
// bool Login().islogged = false;
bool isUserlogged = Login().isLogged(false);

enum MenuState { home, favorite, message, profile }

// Map userLogged = Complemento().getUsersfromEmail(usuarios, emailUsuario);
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
                  "assets/icons/oferta.svg",
                  color: Colors.black,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Categoria.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: Colors.black87,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Promocoes.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Location point.svg",
                  color: Colors.blueAccent,
                  height: 105,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.NomeNavegacao),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/suporte-24-horas (1).svg",
                  color: Colors.black,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, formulario.NomeNavegacao),
                // Navigator.pushNamed(context, HomeCatalogo.NomeNavegacao),
                // Navigator.pushNamed(context, HomeProdutos.NomeNavegacao),
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // print(isUserlogged);
                    // if (isUserlogged == false) {
                    // Navigator.pushNamed(context, Login.NomeNavegacao);
                    // } else if (isUserlogged == true) {
                    Navigator.pushReplacementNamed(
                        context, ProfileScreen.NomeNavegacao);
                    // }
                  }),
            ],
          )),
    );
  }
}
