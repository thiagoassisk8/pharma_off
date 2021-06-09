import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_off/home/rest_api/EsqueciSenha.dart';
import 'package:pharma_off/palheta/theme.dart';

class Esquecisenha extends StatelessWidget {
  static String NomeNavegacao = "/esquecisenha";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  bool _rememberMe = false;
  @override
  // String senha;
  // bool _showPassword = false;

  Widget build(BuildContext context) {
    // _sendForm()
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Redefinir Senha",
            textScaleFactor: 1.1,
            style: TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 80,
              child: Image.asset(
                "assets/images/pharmaoff_logo_azul.png",
                fit: BoxFit.fitHeight,
                height: 190.0,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Esqueceu sua Senha?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Por favor, informe o E-mail associado a sua conta, que enviaremos um link para o mesmo com as instruções para restauração de sua senha",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              key: _formKey,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                prefixIcon: Icon(Icons.email_rounded),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "E-mail Obrigatório";
                }
                if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                    .hasMatch(value)) {
                  return "Por Favor, entre com um e-mail válido";
                }
                return null;
              },
              onSaved: (String value) {
                email = value;
              },
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: new Container(
                margin: new EdgeInsets.all(15.0),
                child: new Form(
                  // autovalidate: _validate,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                    child: Text(
                      'ENVIAR',
                      style: TextStyle(
                        color: AzulPrimario,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onPressed: () async {
                      print('fORM KEY>>> ${_formKey.currentState}');
                      if (!_formKey.currentState.validate()) {
                        return null;
                      } else {
                        _formKey.currentState.save();
                        var response =
                            await APIForgottenPwd().forgotPassword(email);
                        print(response.status);

                        if (response.status != "success") {
                          SnackBar snackbar = new SnackBar(
                            content: Text(
                              "Não existe uma conta com este e-mail!!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.red[600],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          SnackBar snackbar = new SnackBar(
                            content: Text(
                              "Enviado com Sucesso!!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green[600],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          print(response.data);
                        }
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
