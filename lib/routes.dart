import 'package:flutter/widgets.dart';
import 'package:pharma_off/Telas/home/components/mappage.dart';
import 'package:pharma_off/Telas/home/components/mapa.dart';

import 'package:pharma_off/Telas/home/home_screen.dart';
import 'package:pharma_off/Telas/splash/splash_screen.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MapPage.routeName: (context) => MapPage(),
  Mapa.routeName: (context) => Mapa(),
  HomeScreen.routeName: (context) => HomeScreen(),

 // CartScreen.routeName: (context) => CartScreen(),

};
