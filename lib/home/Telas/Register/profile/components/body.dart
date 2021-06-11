import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/palheta/theme.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 40),
          Text("Seja Bem-Vindo ao PharmaOff",
              textScaleFactor: 1.4,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text("Você está Online",
              textScaleFactor: 1.4,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 300),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () => Navigator.pushNamed(context, Login.NomeNavegacao),
          ),
        ],
      ),
    );
  }
}
