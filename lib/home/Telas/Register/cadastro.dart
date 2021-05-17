import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_off/palheta/theme.dart';


class cadastro extends StatelessWidget {
  static String NomeNavegacao = "/cadastro";
  @override
cadastro createState() => cadastro();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, senha, Confirmarsenha;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          title: Text("Login", textScaleFactor: 1.5,
              style:
              TextStyle(color: AzulPrimario ,fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body:
        SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: new Container(
                  margin: new EdgeInsets.all(15.0),
                child: new Form(
                    key: _key,
                    autovalidate: _validate,
                    child: _formUI(),

                    ),
              ),

    ),
);
  }

  Widget _formUI() {

    return new Column(

      children: <Widget>[


                Image.asset(
                  "assets/images/pharmaoff_logo_azul.png",
                  fit: BoxFit.fill,
                  height: 50.0,
                ),
                SizedBox(
                  height: 90.0,
                ),

        new TextFormField(
            decoration: new InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
            validator: _validarEmail,
            onSaved: (String val) {
              email = val;
            }),

        new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(hintText: 'Senha'),
            keyboardType: TextInputType.text,
            maxLength: 11,
            validator: _validarSenha,
            onSaved: (String val) {
              senha = val;
            }),
        new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(hintText: 'Confirmar Senha'),
            keyboardType: TextInputType.text,
            maxLength: 11,
            validator: _confirmarSenha,
            onSaved: (String val) {
              Confirmarsenha = val;
            }),


        new SizedBox(height: 15.0),
        new RaisedButton(
        padding: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 15),
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(12.5),
    ),
    textColor:Colors.blueAccent,
    onPressed: _sendForm,
    child: new Text('Sing up',style: new TextStyle(fontSize: 23.0),),
    color: Colors.white,







        )
         ],
    );
  }


  String _validarSenha(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Senha';
    }
  }
  String _confirmarSenha(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Confirme sua senha';
    }
  }
  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Email $email");
      print("Digite sua senha $senha");
      print("Digite sua senha novamente $senha");
    } else {
      // erro de validação
      // setState(() {
      //   _validate = true;
      // });
    }
  }
}