import 'package:flutter/widgets.dart';
import 'package:pharma_off/Telas/home/components/cupons.dart';
import 'package:pharma_off/Telas/home/components/desejos.dart';
import 'package:pharma_off/Telas/home/components/promo%C3%A7%C3%B5es.dart';
import 'package:pharma_off/Telas/lista.dart';
import 'package:pharma_off/Telas/home/components/suporte.dart';
//import 'package:pharma_off/Telas/home/components/mapa.dart';

import 'package:pharma_off/Telas/home/home_screen.dart';
import 'package:pharma_off/Telas/splash/splash_screen.dart';



// We use name route
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
