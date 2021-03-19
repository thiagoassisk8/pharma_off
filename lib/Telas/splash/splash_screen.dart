import 'package:flutter/material.dart';
import 'package:pharma_off/Telas/home/components/mapa.dart';
import 'package:pharma_off/Telas/home/home_screen.dart';
import 'package:pharma_off/Telas/splash/components/body.dart';

import 'package:pharma_off/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
