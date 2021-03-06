import 'package:flutter/widgets.dart';
import 'package:pharma_off/home/Telas/Register/ForgotPwd/EsqueciSenha.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/home/Telas/Register/profile/profile_screen.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/TesteCatalogo.dart';
import 'package:pharma_off/home/Telas/catalogo/home/home_screen.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/todosprodutosON.dart';
import 'package:pharma_off/home/Telas/desejos.dart';
import 'package:pharma_off/home/Telas/categorias/pele.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/promoOn.dart';
import 'package:pharma_off/home/Telas/categorias/remedios.dart';
import 'package:pharma_off/home/Telas/categorias/higiene.dart';
import 'package:pharma_off/home/Telas/categorias/promo.dart';
import 'package:pharma_off/home/Telas/GeoLocator/lista.dart';
import 'package:pharma_off/home/Telas/suporte.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'package:pharma_off/splash/splash_screen.dart';
import 'package:pharma_off/home/Telas/TestesAPIS/TesteCatalogo.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> navegacoes = {
  SplashScreen.NomeNavegacao: (context) => SplashScreen(),
  Formulario.NomeNavegacao: (context) => Formulario(),
  //Mapa.NomeNavegacao: (context) => Mapa(),
  HomeScreen.NomeNavegacao: (context) => HomeScreen(),
  Lista.NomeNavegacao: (context) => Lista(),
  Login.NomeNavegacao: (context) => LoginUser(),
  Cadastro.NomeNavegacao: (context) => CadastroUser(),
  ProfileScreen.NomeNavegacao: (context) => ProfileScreen(),
  Pele.NomeNavegacao: (context) => Pele(),
  Categoria.NomeNavegacao: (context) => Categoria(),
  Desejos.NomeNavegacao: (context) => Desejos(),
  Remedio.NomeNavegacao: (context) => Remedio(),
  Promocoes.NomeNavegacao: (context) => Promocoes(),
  Higiene.NomeNavegacao: (context) => Higiene(),
  Esquecisenha.NomeNavegacao: (context) => Esquecisenha(),
  Home.NomeNavegacao: (context) => Home(),
  HomeProdutos.NomeNavegacao: (context) => HomeProdutos(),
  HomeCatalogo.NomeNavegacao: (context) => HomeCatalogo(),
};
