import 'package:flutter/material.dart';
import 'package:pharma_off/splash/componentes/body.dart';
import 'package:pharma_off/palheta/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String NomeNavegacao = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
