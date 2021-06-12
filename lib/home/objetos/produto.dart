import 'package:flutter/material.dart';
import 'package:pharma_off/home/rest_api/BuscaOfertas.dart';
import 'package:pharma_off/palheta/theme.dart';

class Produto {
  String status;
  int results;
  List<dynamic> data = [];

  Produto({this.status, this.results, this.data});

  Produto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = (json['data'][0] as List)
        .map((e) {
          return Data.fromJson(e);
        })
        .cast<dynamic>()
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    data['data'] = this.data;
    print('chega até aqui? || Data >> ${data}');
    return data;
  }
}

class Data {
  // List<dynamic> Produtolist = [];

  int id;
  String name;
  String price;
  String desc;
  String imgPath;
  bool isFavourite;
  bool isPopular;
  int categoria;
  int estabelecimento;
  bool onsale;
  String newprice;

  Data(
      this.id,
      this.name,
      this.price,
      this.desc,
      this.categoria,
      this.imgPath,
      this.isFavourite,
      this.estabelecimento,
      this.isPopular,
      this.onsale,
      this.newprice);

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        json['id_produto'] as int,
        json['nme_produto'] as String,
        json['preco_produto'] as String,
        json['desc_produto'] as String,
        json['cod_categoria'] as int,
        json['img_produto'] as String,
        json['isfavourite'] as bool,
        json['cod_estabelecimentoparceiro'] as int,
        json['ispopular'] as bool,
        json['onsale'] as bool,
        json['preco_novoproduto'] as String);
  }
}

// LOCALHOST

class LocalHost {
  final int categoria;
  final int id;
  final int cod_estabelecimento;
  final String name;
  final double price;
  final String desc;
  final bool onsale;
  final String imgPath;
  final bool isFavourite, isPopular;

  LocalHost({
    this.categoria,
    this.id,
    this.cod_estabelecimento,
    this.name,
    this.price,
    this.desc,
    this.onsale,
    this.imgPath,
    this.isPopular = true,
    this.isFavourite = true,
  });

  static List<LocalHost> LocalHostlist = [
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "Paracetamol 750mg",
      desc:
          "O paracetamol reduz a febre atuando no centro regulador da temperatura no Sistema Nervoso Central (SNC) e diminui a sensibilidade para a dor. Seu efeito tem início 15 a 30 minutos após a administração oral e permanece por um período de 4 a 6 horas.",
      price: 5.99,
      onsale: true,
      imgPath: "remedio.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "NEOSORO",
      desc:
          "NEOSORO É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO OU UM FARMACÊUTICO. LEIA A BULA. MEDICAMENTOS PODEM CAUSAR EFEITOS INDESEJADOS. EVITE A AUTOMEDICAÇÃO: INFORME-SE COM O FARMACÊUTICO.",
      price: 5.50,
      onsale: true,
      imgPath: "neosoro.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "Benegrip Multi Sabor ",
      desc:
          "O Benegrip Multi é analgésico, antitérmico e descongestionante nasal, tudo em um só produto, facilitando o tratamento contra os diferentes sintomas da gripe. Sua fórmula exclusiva permite dosagens diferentes para crianças a partir de 2 anos de idade até adultos e idosos. ",
      price: 30.50,
      onsale: true,
      imgPath: "benegrip.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "FUROSEMIDA 40mg ",
      desc:
          "Furosemida é um medicamento diurético, intensificador da excreção de urina e sódio pelo organismo. É um inibidor de indicação e, consequentemente, uso na remoção de edema devido a problemas cardíacos, hepáticos ou renais.",
      price: 5.50,
      onsale: true,
      imgPath: "furosemida.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "Mascaras",
      desc:
          "Máscara cirúrgica descartável com clipe nasal ajustável totalmente revestido, atóxica, hipoalérgica, oferecendo filtragem de no mínimo 95% de eficácia, com elástico. INDICAÇÃO DE USO:A máscara cirúrgica deve ser utilizada por profissionais...",
      price: 40.50,
      onsale: true,
      imgPath: "mascaras.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "Sabonete em Barra Phebo ",
      desc:
          "Phebo Odor de Rosas é a primeira fragrância da Perfumaria Phebo, criada em 1930. Mantém a sua formula original, exótica com toque de especiarias e flores. Sabonete com base vegetal e glicerina 100% natural.",
      price: 2.50,
      onsale: true,
      imgPath: "sabao.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "FRALDA PAMPERS",
      desc:
          "A Fralda Pampers SuperSec mantém seu bebê mais seco do que outras fraldas por 1 noite inteira, porque somente  Supersec tem canais extra-absorventes exclusivos, que distribuem o xixi uniformemente e impedem que ele entre em contato com a pele do seu bebê.",
      price: 35.39,
      onsale: true,
      imgPath: "fralda.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "COLGATE SENSITIVE PRO-ALÍVIO ",
      desc:
          "O Creme Dental Colgate Sensitive Pro alivio Imediato Origina,l sua fórmula funciona vedando os canais que levam ao centro do dente, bloqueando a sensibilidade. Fórmula clinicamente comprovada e desenvolvida com o poder da tecnologia da Arginina para uma ação imediata e eficaz contra o desconforto causado pela sensibilidade nos dentes.",
      price: 15.25,
      onsale: true,
      imgPath: "colgate.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "CREME FACIAL NIVEA NUTRITIVO 100G",
      desc:
          "O Creme Facial Nutritivo Nivea possui fórmula ultra leve com Tecnologia Hydro-Waxes à base de água e karité. Proporciona hidratação intensa por até 24 horas sem deixar sensação oleosa e ainda prepara a pele para a maquiagem, para uma pele bonita e com aspecto saudável.",
      price: 28.87,
      onsale: true,
      imgPath: "creme.png",
    ),
    LocalHost(
      categoria: 3,
      cod_estabelecimento: 1,
      name: "LOÇÃO HIDRATANTE NEUTROGENA ",
      desc:
          "O Hidratante Corporal Neutrogena Body Care Intensive Extra Care vai além da hidratação básica, pois sua fórmula tem proteínas da aveia para hidratação intensa e glicerina, eliminando a aparência esbranquiçada da pele seca e deixando a mais macia e hidratada.",
      price: 21.25,
      onsale: true,
      imgPath: "loçao.png",
    ),
  ];
  static List<LocalHost> pelelist = [
    LocalHost(
      categoria: 2,
      cod_estabelecimento: 1,
      name: "CREME FACIAL NIVEA NUTRITIVO 100G",
      desc:
          "O Creme Facial Nutritivo Nivea possui fórmula ultra leve com Tecnologia Hydro-Waxes à base de água e karité. Proporciona hidratação intensa por até 24 horas sem deixar sensação oleosa e ainda prepara a pele para a maquiagem, para uma pele bonita e com aspecto saudável.",
      price: 28.87,
      onsale: true,
      imgPath: "creme.png",
    ),
    LocalHost(
      categoria: 2,
      cod_estabelecimento: 1,
      name: "LOÇÃO HIDRATANTE NEUTROGENA ",
      desc:
          "O Hidratante Corporal Neutrogena Body Care Intensive Extra Care vai além da hidratação básica, pois sua fórmula tem proteínas da aveia para hidratação intensa e glicerina, eliminando a aparência esbranquiçada da pele seca e deixando a mais macia e hidratada.",
      price: 21.25,
      onsale: true,
      imgPath: "loçao.png",
    ),
  ];
  static List<LocalHost> higienelist = [
    LocalHost(
      categoria: 1,
      cod_estabelecimento: 1,
      name: "Mascaras",
      desc:
          "Máscara cirúrgica descartável com clipe nasal ajustável totalmente revestido, atóxica, hipoalérgica, oferecendo filtragem de no mínimo 95% de eficácia, com elástico. INDICAÇÃO DE USO:A máscara cirúrgica deve ser utilizada por profis...",
      price: 40.50,
      onsale: true,
      imgPath: "mascaras.png",
    ),
    LocalHost(
      categoria: 1,
      cod_estabelecimento: 1,
      name: "Sabonete em Barra Phebo ",
      desc:
          "Phebo Odor de Rosas é a primeira fragrância da Perfumaria Phebo, criada em 1930. Mantém a sua formula original, exótica com toque de especiarias e flores. Sabonete com base vegetal e glicerina 100% natural.",
      price: 2.50,
      onsale: true,
      imgPath: "sabao.png",
    ),
    LocalHost(
      categoria: 1,
      cod_estabelecimento: 1,
      name: "FRALDA PAMPERS",
      desc:
          "A Fralda Pampers SuperSec mantém seu bebê mais seco do que outras fraldas por 1 noite inteira, porque somente  Supersec tem canais extra-absorventes exclusivos, que distribuem o xixi uniformemente e impedem que ele entre em contato com a pele do seu bebê.",
      price: 35.39,
      onsale: true,
      imgPath: "fralda.png",
    ),
    LocalHost(
      categoria: 1,
      cod_estabelecimento: 1,
      name: "COLGATE SENSITIVE PRO-ALÍVIO ",
      desc:
          "O Creme Dental Colgate Sensitive Pro alivio Imediato Origina,l sua fórmula funciona vedando os canais que levam ao centro do dente, bloqueando a sensibilidade. Fórmula clinicamente comprovada e desenvolvida com o poder da tecnologia da Arginina para uma ação imediata e eficaz contra o desconforto causado pela sensibilidade nos dentes.",
      price: 15.25,
      onsale: true,
      imgPath: "colgate.png",
    ),
  ];
  static List<LocalHost> remediolist = [
    LocalHost(
      categoria: 0,
      cod_estabelecimento: 1,
      name: "Paracetamol 750mg",
      desc:
          "O paracetamol reduz a febre atuando no centro regulador da temperatura no Sistema Nervoso Central (SNC) e diminui a sensibilidade para a dor. Seu efeito tem início 15 a 30 minutos após a administração oral e permanece por um período de 4 a 6 horas.",
      price: 5.99,
      onsale: true,
      imgPath: "remedio.png",
    ),
    LocalHost(
      categoria: 0,
      cod_estabelecimento: 1,
      name: "NEOSORO",
      desc:
          "NEOSORO É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO OU UM FARMACÊUTICO. LEIA A BULA. MEDICAMENTOS PODEM CAUSAR EFEITOS INDESEJADOS. EVITE A AUTOMEDICAÇÃO: INFORME-SE COM O FARMACÊUTICO.",
      price: 5.50,
      onsale: true,
      imgPath: "neosoro.png",
    ),
    LocalHost(
      categoria: 0,
      cod_estabelecimento: 1,
      name: "Benegrip Multi Sabor ",
      desc:
          "O Benegrip Multi é analgésico, antitérmico e descongestionante nasal, tudo em um só produto, facilitando o tratamento contra os diferentes sintomas da gripe. Sua fórmula exclusiva permite dosagens diferentes para crianças a partir de 2 anos de idade até adultos e idosos. ",
      price: 30.50,
      onsale: true,
      imgPath: "benegrip.png",
    ),
    LocalHost(
      categoria: 0,
      cod_estabelecimento: 1,
      name: "FUROSEMIDA 40mg ",
      desc:
          "Furosemida é um medicamento diurético, intensificador da excreção de urina e sódio pelo organismo. É um inibidor de indicação e, consequentemente, uso na remoção de edema devido a problemas cardíacos, hepáticos ou renais.",
      price: 5.50,
      onsale: true,
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
