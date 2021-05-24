import 'package:flutter/material.dart';
import 'package:pharma_off/home/Navigation_bar/coustom_bottom_nav_bar.dart';
import 'package:pharma_off/palheta/theme.dart';


import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String NomeNavegacao = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        title: Text("Perfil do Usuário", textScaleFactor: 1.3,
            style:
            TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
