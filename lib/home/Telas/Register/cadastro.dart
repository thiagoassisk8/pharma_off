import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/home/rest_api/SignUpUser.dart';

class cadastro extends StatelessWidget {
  static String NomeNavegacao = "/cadastro";
  @override
  var _userObject = {};
  final _senhaController = TextEditingController();
  String email;
  String senha;
  String confirmsenha;
  bool _showPassword = false;

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyToken = GlobalKey<FormState>();
  bool _rememberMe = false;

  BuildContext get context => null;
  Widget _buildEmailTF() {
    return TextFormField(
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
        });
  }

  Widget _buildPasswordTF() {
    return TextFormField(
      controller: _senhaController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Senha",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Senha Obrigatória";
        }
        return null;
      },
    );
  }

  Widget _buildConfirmaSenha() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Confirmar senha",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Confirmação de senha obrigatória";
        }
        if (value != _senhaController.text) {
          return "As senhas não coincidem";
        }
        return null;
      },
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 55.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (!_formKey.currentState.validate()) {
            return;
          } else {
            _formKey.currentState.save();

            _formKeyToken.currentState.save();

            var response = await APISingUp().singUp(_userObject['email_pessoa'],
                _userObject['pwd_pessoa'], _userObject['nme_pessoa']);
            //verificando usuário
            if (response.token != null) {
              SnackBar snackbar = new SnackBar(
                content: Text(
                  "Usuário cadastrado com sucesso",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green[600],
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.of(context).pushReplacementNamed("/login");
            } else {
              SnackBar snackbar = new SnackBar(
                content: Text(
                  "E-mail já cadastrado",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red[600],
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: AzulPrimario,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Login",
            textScaleFactor: 1.5,
            style: TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: new Container(
              margin: new EdgeInsets.all(15.0),
              child: new Form(
                key: _key,
                autovalidate: _validate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/pharmaoff_logo_azul.png",
                      fit: BoxFit.fill,
                      height: 60.0,
                    ),
                    SizedBox(height: 50.0),
                    _buildEmailTF(),
                    SizedBox(height: 50.0),
                    _buildPasswordTF(),
                    SizedBox(
                      height: 50.0,
                    ),
                    // _buildEmailTF(),

                    _buildConfirmaSenha(),
                    _buildLoginBtn(),
                  ],
                ),
              ))),
    );
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Email $email");
      print("Digite sua senha $senha");
      print("Digite a senha novamente $confirmsenha");
    } else {
      // erro de validação
      //setState(() {
      //_validate = true;
      // });
    }
  }
}
