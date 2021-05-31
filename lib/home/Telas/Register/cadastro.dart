import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_off/home/Telas/Register/Login.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/home/rest_api/SignUpUser.dart';

class CadastroUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Cadastro();
  }
}

class Cadastro extends State<CadastroUser> {
  static String NomeNavegacao = "/cadastro";
  @override
  var _userObject = {};
  final _senhaController = TextEditingController();
  String nome;
  String email;
  String senha;
  String confirmsenha;
  bool _showPassword = false;

  GlobalKey<FormState> _key = new GlobalKey<FormState>();
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
      },
      onSaved: (String value) {
        _userObject['email_usuario'] = value;
      },
    );
  }

  Widget _buildNome() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        prefixIcon: Icon(Icons.account_circle_rounded),
        labelText: "Nome",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Nome Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['nme_usuario'] = value;
      },
    );
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
      onSaved: (String value) {
        _userObject['pwd_usuario'] = value;
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
      // onSaved: (String value) {
      // _userObject['pwd_usuario'] = value;
      // },
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 55.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (!_formKeyToken.currentState.validate()) {
            return;
          } else {
            // _formKey.currentState.save();

            _formKeyToken.currentState.save();

            var response = await APISingUp().singUp(
                _userObject['email_usuario'],
                _userObject['pwd_usuario'],
                _userObject['nme_usuario']);
            //verificando usuário
            if (response != null) {
              SnackBar snackbar = new SnackBar(
                content: Text(
                  "Usuário cadastrado com sucesso",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green[600],
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              // Navigator.pushReplacementNamed(context, Login.NomeNavegacao);
            } else {
              SnackBar snackbar = new SnackBar(
                content: Text(
                  "E-mail já cadastrado",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red[600],
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              // Navigator.of(context).pushReplacementNamed(Login.NomeNavegacao);
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
        centerTitle: true,
        title: Text("Sign Up",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
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
                key: _formKeyToken,
                autovalidate: _validate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/pharmaoff_logo_azul.png",
                      fit: BoxFit.fill,
                      height: 60.0,
                    ),
                    SizedBox(height: 40.0),
                    _buildNome(),
                    SizedBox(height: 40.0),
                    _buildEmailTF(),
                    SizedBox(height: 50.0),
                    _buildPasswordTF(),
                    SizedBox(
                      height: 50.0,
                    ),
                    // _buildEmailTF(),

                    _buildConfirmaSenha(),
                    _buildSignupBtn(),
                  ],
                ),
              ))),
    );
  }

  _sendForm() {
    if (_formKeyToken.currentState.validate()) {
      // Sem erros na validação
      // _formKey.currentState.save();
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
