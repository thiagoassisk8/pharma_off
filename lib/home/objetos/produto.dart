import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';

class Produto {
  final int categoria;
  final int id;
  final String estabelecimento;
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String imgPath;
  final bool isFavourite, isPopular;


  Produto({
    this.categoria,
    this.id,
    this.estabelecimento,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.imgPath,
    this.isPopular = true,
    this.isFavourite = true,
  });

  static List<Produto> ofertaslist = [
    Produto(
      categoria: 0,
      estabelecimento: "Drogaria Onofre",
      name: "Paracetamol 750mg",
      desc: "O paracetamol reduz a febre atuando no centro regulador da temperatura no Sistema Nervoso Central (SNC) e diminui a sensibilidade para a dor. Seu efeito tem início 15 a 30 minutos após a administração oral e permanece por um período de 4 a 6 horas.",
      price: 5.99,
      color: AppColors.blueColor,
      imgPath: "remedio.png",
    ),

    Produto(
      categoria: 1,
      estabelecimento: "Droga Raia",
      name: "COLGATE SENSITIVE PRO-ALÍVIO ",
      desc: "O Creme Dental Colgate Sensitive Pro alivio Imediato Origina,l sua fórmula funciona vedando os canais que levam ao centro do dente, bloqueando a sensibilidade. Fórmula clinicamente comprovada e desenvolvida com o poder da tecnologia da Arginina para uma ação imediata e eficaz contra o desconforto causado pela sensibilidade nos dentes.",
      price: 15.25,
      color: AppColors.blueColor,
      imgPath: "colgate.png",
    ),




  ];
  static List<Produto> higienelist = [
    Produto(
      categoria: 1,
      estabelecimento: "Ultrafarma",
      name: "CREME FACIAL NIVEA NUTRITIVO 100G",
      desc: "O Creme Facial Nutritivo Nivea possui fórmula ultra leve com Tecnologia Hydro-Waxes à base de água e karité. Proporciona hidratação intensa por até 24 horas sem deixar sensação oleosa e ainda prepara a pele para a maquiagem, para uma pele bonita e com aspecto saudável.",
      price: 28.87,
      color: AppColors.blueColor,
      imgPath: "creme.png",
    ),
    Produto(
      categoria: 1,
      estabelecimento: "Drogasil",
      name: "Mascaras",
      desc: "Máscara cirúrgica descartável com clipe nasal ajustável totalmente revestido, atóxica, hipoalérgica, oferecendo filtragem de no mínimo 95% de eficácia, com elástico. INDICAÇÃO DE USO:A máscara cirúrgica deve ser utilizada por profis...",
      price: 40.50,
      color: AppColors.blueColor,
      imgPath: "mascaras.png",
    ),
    Produto(
      categoria: 1,
      estabelecimento: "Ultrafarma",
      name: "Sabonete em Barra Phebo ",
      desc: "Phebo Odor de Rosas é a primeira fragrância da Perfumaria Phebo, criada em 1930. Mantém a sua formula original, exótica com toque de especiarias e flores. Sabonete com base vegetal e glicerina 100% natural.",
      price: 2.50,
      color: AppColors.blueColor,
      imgPath: "sabao.png",
    ),
    Produto(
      categoria: 1,
      estabelecimento: "Drogasil",
      name: "FRALDA PAMPERS",
      desc: "A Fralda Pampers SuperSec mantém seu bebê mais seco do que outras fraldas por 1 noite inteira, porque somente  Supersec tem canais extra-absorventes exclusivos, que distribuem o xixi uniformemente e impedem que ele entre em contato com a pele do seu bebê.",
      price: 35.39,
      color: AppColors.blueColor,
      imgPath: "fralda.png",
    ),
    Produto(
      categoria: 1,
      estabelecimento: "Droga Raia",
      name: "COLGATE SENSITIVE PRO-ALÍVIO ",
      desc: "O Creme Dental Colgate Sensitive Pro alivio Imediato Origina,l sua fórmula funciona vedando os canais que levam ao centro do dente, bloqueando a sensibilidade. Fórmula clinicamente comprovada e desenvolvida com o poder da tecnologia da Arginina para uma ação imediata e eficaz contra o desconforto causado pela sensibilidade nos dentes.",
      price: 15.25,
      color: AppColors.blueColor,
      imgPath: "colgate.png",
    ),

  ];
  static List<Produto> remediolist = [
    Produto(
      categoria: 0,
      estabelecimento: "Drogaria Onofre",
      name: "Paracetamol 750mg",
      desc: "O paracetamol reduz a febre atuando no centro regulador da temperatura no Sistema Nervoso Central (SNC) e diminui a sensibilidade para a dor. Seu efeito tem início 15 a 30 minutos após a administração oral e permanece por um período de 4 a 6 horas.",
      price: 5.99,
      color: AppColors.blueColor,
      imgPath: "remedio.png",
    ),

    Produto(
      categoria: 0,
      estabelecimento: "Droga Raia",
      name: "NEOSORO",
      desc: "NEOSORO É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO OU UM FARMACÊUTICO. LEIA A BULA. MEDICAMENTOS PODEM CAUSAR EFEITOS INDESEJADOS. EVITE A AUTOMEDICAÇÃO: INFORME-SE COM O FARMACÊUTICO.",
      price: 5.50,
      color: AppColors.blueColor,
      imgPath: "neosoro.png",
    ),
  Produto(
  categoria: 0,
  estabelecimento: "Drogaria Onofre",
  name: "Benegrip Multi Sabor ",
  desc: "O Benegrip Multi é analgésico, antitérmico e descongestionante nasal, tudo em um só produto, facilitando o tratamento contra os diferentes sintomas da gripe. Sua fórmula exclusiva permite dosagens diferentes para crianças a partir de 2 anos de idade até adultos e idosos. ",
  price: 30.50,
  color: AppColors.blueColor,
  imgPath: "benegrip.png",
  ),
    Produto(
      categoria: 0,
      estabelecimento: "Rosário",
      name: "FUROSEMIDA 40mg ",
      desc: "Furosemida é um medicamento diurético, intensificador da excreção de urina e sódio pelo organismo. É um inibidor de indicação e, consequentemente, uso na remoção de edema devido a problemas cardíacos, hepáticos ou renais.",
      price: 5.50,
      color: AppColors.blueColor,
      imgPath: "furosemida.png",
    ),
  ];
}

class FlutterIcons {
  FlutterIcons._();

  static const _kFontFam = 'FlutterIcons';
  static const _kFontPkg = null;

  static const IconData add =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData list =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bag =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData compass =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person_outline =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData converse =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData nike =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData left_open_1 =
      IconData(0xf007, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
