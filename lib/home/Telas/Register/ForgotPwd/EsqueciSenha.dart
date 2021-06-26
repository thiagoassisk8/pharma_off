import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';

import 'components/bodyEsqueciSenha.dart';

class Esquecisenha extends StatelessWidget {
  static String NomeNavegacao = "/esquecisenha";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci Senha",
            textScaleFactor: 1.1,
            style: TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
      ),
      body: BodyEsqueciSenha(),
    );
  }
}
