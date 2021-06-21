import 'package:flutter/material.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/home/rest_api/SuporteFormulario.dart';

class Formulario extends StatelessWidget {
  var _userObject = {};
  static String NomeNavegacao = "/formulario";

  @override
  Formulario createState() => Formulario();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, email, celular, mensagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Suporte",
            textScaleFactor: 1.2,
            style: TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _validate,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/pharmaoff_logo_azul.png',
                  height: 90,

                  // fit: BoxFit.fill,
                  // height: 1000.0,
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                new TextFormField(
                  decoration: new InputDecoration(hintText: 'Nome Completo'),
                  maxLength: 40,
                  validator: _validarNome,
                  onSaved: (String value) {
                    _userObject['nme_formulario'] = value;
                  },
                ),
                new TextFormField(
                    decoration: new InputDecoration(hintText: 'Celular'),
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    validator: _validarCelular,
                    onSaved: (String value) {
                      _userObject['cel_formulario'] = value;
                    }),
                new TextFormField(
                    decoration: new InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 40,
                    validator: _validarEmail,
                    onSaved: (String value) {
                      _userObject['email_formulario'] = value;
                    }),
                new TextFormField(
                    decoration: new InputDecoration(hintText: 'Mensagem'),
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 500,
                    onSaved: (String value) {
                      _userObject['msg_formulario'] = value;
                    }),
                new SizedBox(height: 15.0),
                new RaisedButton(
                  padding:
                      EdgeInsets.only(left: 70, top: 20, right: 70, bottom: 20),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.5),
                  ),
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_key.currentState.validate()) {
                      // Sem erros na validação
                      _key.currentState.save();
                      var response = APISuporte().suporte(
                          _userObject['nme_formulario'],
                          _userObject['cel_formulario'],
                          _userObject['email_formulario'],
                          _userObject['msg_formulario']);
                      print(response);

                      if (response != null) {
                        SnackBar snackbar = new SnackBar(
                          content: Text(
                            "FeedBack enviado com sucesso",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green[600],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else if (response == null) {
                        print('chegou ate aqui');
                        SnackBar snackbar = new SnackBar(
                          content: Text(
                            "E-mail já cadastrado",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.red[600],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }

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
                  },

                  // },
                  child: new Text(
                    'Enviar',
                    style: new TextStyle(fontSize: 23.0),
                  ),
                  color: AzulPrimario,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _formUI() {
  // return new
  // }
// }

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
    } else if (value.length != 8) {
      return "O celular deve ter 8 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }
}
// _sendForm(context) async {}
