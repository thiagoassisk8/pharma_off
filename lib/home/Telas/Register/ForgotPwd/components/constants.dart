import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/size_config.dart';

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String EmailNullError = "Digite seu email";
const String InvalidEmailError = "Por favor digite um email válido";
const String PassNullError = "Please Enter your password";
const String ShortPassError = "Password is too short";
const String MatchPassError = "Passwords don't match";
const String NamelNullError = "Please Enter your name";
const String PhoneNumberNullError = "Please Enter your phone number";
const String AddressNullError = "Please Enter your address";
