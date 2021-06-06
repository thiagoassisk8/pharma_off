import 'package:flutter/widgets.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/home/Telas/Register/profile/profile_screen.dart';
import 'package:pharma_off/home/Telas/catalogo/home/home_screen.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/Register/esquecisenha.dart';
import 'package:pharma_off/home/Telas/categorias/pele.dart';
import 'package:pharma_off/home/Telas/categorias/remedios.dart';
import 'package:pharma_off/home/Telas/categorias/higiene.dart';
import 'package:pharma_off/home/Telas/categorias/promo.dart';
import 'package:pharma_off/home/Telas/GeoLocator/lista.dart';
import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'package:pharma_off/splash/splash_screen.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> navegacoes = {
  SplashScreen.NomeNavegacao: (context) => SplashScreen(),
  formulario.NomeNavegacao: (context) => formulario(),
  //Mapa.NomeNavegacao: (context) => Mapa(),
  HomeScreen.NomeNavegacao: (context) => HomeScreen(),
  Lista.NomeNavegacao: (context) => Lista(),
  Login.NomeNavegacao: (context) => LoginUser(),
  Cadastro.NomeNavegacao: (context) => CadastroUser(),
  ProfileScreen.NomeNavegacao: (context) => ProfileScreen(),
  Pele.NomeNavegacao: (context) => Pele(),
  Categoria.NomeNavegacao: (context) => Categoria(),
  Desejos.NomeNavegacao: (context) => Desejos(),
  Remedios.NomeNavegacao: (context) => Remedios(),
  Promocoes.NomeNavegacao: (context) => Promocoes(),
  Higiene.NomeNavegacao: (context) => Higiene(),
  Esquecisenha.NomeNavegacao: (context) => Esquecisenha(),

  // CartScreen.NomeNavegacao: (context) => CartScreen(),
};
