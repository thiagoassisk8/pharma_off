import 'package:flutter/material.dart';
import 'package:pharma_off/components/coustom_bottom_nav_bar.dart';
import 'package:pharma_off/Telas/mapa.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapaState(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
