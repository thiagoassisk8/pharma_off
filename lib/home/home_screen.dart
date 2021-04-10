import 'package:flutter/material.dart';
import 'package:pharma_off/home/Navigation_bar/coustom_bottom_nav_bar.dart';
import 'package:pharma_off/home/Telas/mapa.dart';


class HomeScreen extends StatelessWidget {
  static String NomeNavegacao = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapaState(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
