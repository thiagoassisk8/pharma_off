import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_off/theme.dart';
import 'package:pharma_off/Telas/splash/splash_screen.dart';
import 'package:pharma_off/routes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'PharmaOFF',
    initialRoute: SplashScreen.routeName,
    routes: routes,
  );
}
}