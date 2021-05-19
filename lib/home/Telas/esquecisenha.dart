
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';

class esquecisenha extends StatelessWidget {
  static String NomeNavegacao = "/esquecisenha";
  @override

  String email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String senha;
  bool _showPassword = false;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool _rememberMe = false;

  BuildContext get context => null;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar:

        AppBar(
          elevation: 0,
          title: Text("Redefinir senha", textScaleFactor: 1.3,
              style:
              TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body:
        Container(
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
                child: Image.asset(  "assets/images/pharmaoff_logo_azul.png",
                  fit: BoxFit.fill,
                  height: 190.0,),
              ),
              SizedBox(
                height: 70,
              ),
              Text("Esqueceu sua Senha?",
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25),),
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
                  }
              ),

              SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: new Container(
                  margin: new EdgeInsets.all(15.0),
                child: new Form(
                  key: _key,
                  autovalidate: _validate,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: _sendForm,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Text('ENVIAR',
                    style: TextStyle(
                      color: AzulPrimario,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),

              ),
              )],
          ),
        ),

    );


  }
  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Email $email");
    } else {
      // erro de validação
      //setState(() {
      //_validate = true;
      // });
    }
  }
}