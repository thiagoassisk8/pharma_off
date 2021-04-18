import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';
class FlutterIcons {
  FlutterIcons._();

  static const _kFontFam = 'FlutterIcons';
  static const _kFontPkg = null;

  static const IconData add = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData list = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bag = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData compass = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person_outline = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData converse = IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search = IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData nike = IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData left_open_1 = IconData(0xf007, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      name: "Ivermectina",
      desc:
          "A cura pro covid 19",
      price: 184,
      color: AppColors.blueColor,
      brand: "Rosario",
      imgPath: "remedio.png",
    ),
    ShoeModel(
      name: "Creme",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "creme.png",
    ),
    ShoeModel(
      name: "Mascaras",
      desc:
          "Charlatanismo do Bolsonaro",
      price: 135,
      color: AppColors.redColor,
      brand: "Drogasil",
      imgPath: "mascaras.png",
    ),
  ];
}
