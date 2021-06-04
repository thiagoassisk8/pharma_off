import 'package:flutter/material.dart';
import 'package:pharma_off/home/Navigation_bar/coustom_bottom_nav_bar.dart';


import 'components/body.dart';

class Categoria extends StatelessWidget {
  static String NomeNavegacao = "/categoria";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: null),
    );
  }
}