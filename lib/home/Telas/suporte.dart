import 'package:flutter/material.dart';


class formulario extends StatelessWidget {
  static String NomeNavegacao = "/formulario";
  @override
  formulario createState() => formulario();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, email, celular,mensagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Suporte",textScaleFactor: 1.1, style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        body:
        new SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
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
          'assets/images/pharmaoff_logo_azul.png',
          height: 75,

          // fit: BoxFit.fill,
          // height: 1000.0,
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Nome Completo'),
          maxLength: 40,
          validator: _validarNome,
          onSaved: (String val) {
            nome = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            maxLength: 11,
            validator: _validarCelular,
            onSaved: (String val) {
              celular = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
            validator: _validarEmail,
            onSaved: (String val) {
              email = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Mensagem'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 500,
            validator: _validarEmail,
            onSaved: (String val) {
              mensagem = val;
            }),

        new SizedBox(height: 15.0),
        new RaisedButton(
          padding: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 15),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.5),
          ),
          textColor:Colors.white,
          onPressed: _sendForm,
          child: new Text('Enviar',style: new TextStyle(fontSize: 23.0),),
          color: Colors.blue,





        )
      ],
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
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
      print("Nome $nome");
      print("Celular $celular");
      print("Email $email");
      print("Mensagem $mensagem");
    } else {
      // erro de validação
      // setState(() {
      //   _validate = true;
      // });
    }
  }
}