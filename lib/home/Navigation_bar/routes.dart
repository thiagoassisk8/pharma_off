import 'package:flutter/widgets.dart';
import 'package:pharma_off/home/Telas/cupons.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/promocoes.dart';
import 'package:pharma_off/home/Telas/lista.dart';
import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/splash/splash_screen.dart';


// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  formulario.routeName: (context) => formulario(),
  //Mapa.routeName: (context) => Mapa(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Lista.routeName: (context) => Lista(),
  Cupons.routeName: (context) => Cupons(),
  promocoes.routeName: (context) => promocoes(),
  desejos.routeName: (context) => desejos(),
 // CartScreen.routeName: (context) => CartScreen(),

};
