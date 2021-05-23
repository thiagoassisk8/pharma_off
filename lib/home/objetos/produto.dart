import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:http/http.dart' as http;

class Produto {
  final String estabelecimento;
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String imgPath;

  Produto({
    this.estabelecimento,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.imgPath,
  });

  static List<Produto> list = [
    Produto(
      estabelecimento: "Rosario",
      name: "Ivermectina",
      desc: "Descrição de cada produto irá ficar aqui",
      price: 184,
      color: AppColors.blueColor,
      imgPath: "remedio.png",
    ),
    Produto(
      estabelecimento: "Rosario",
      name: "Creme",
      desc: "Descrição de cada produto irá ficar aqui",
      price: 123,
      color: AppColors.blueColor,
      imgPath: "creme.png",
    ),
    Produto(
      estabelecimento: "Drogasil",
      name: "Mascaras",
      desc: "Descrição de cada produto irá ficar aqui",
      price: 135,
      color: AppColors.blueColor,
      imgPath: "mascaras.png",
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
