
import 'package:flutter/widgets.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/esquecisenha.dart';
import 'package:pharma_off/home/Telas/promocoes.dart';
import 'package:pharma_off/home/Telas/GeoLocator/lista.dart';
import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/splash/splash_screen.dart';


// All our routes will be available here
final Map<String, WidgetBuilder> navegacoes = {
  SplashScreen.NomeNavegacao: (context) => SplashScreen(),
  formulario.NomeNavegacao: (context) => formulario(),
  //Mapa.NomeNavegacao: (context) => Mapa(),
  HomeScreen.NomeNavegacao: (context) => HomeScreen(),
  Lista.NomeNavegacao: (context) => Lista(),
  login.NomeNavegacao: (context) => login(),
  cadastro.NomeNavegacao: (context) => cadastro(),
  promocoes.NomeNavegacao: (context) => promocoes(),
  desejos.NomeNavegacao: (context) => desejos(),
  esquecisenha.NomeNavegacao: (context) => esquecisenha(),
 // CartScreen.NomeNavegacao: (context) => CartScreen(),

};
