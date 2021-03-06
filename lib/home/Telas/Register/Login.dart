import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pharma_off/home/Navigation_bar/coustom_bottom_nav_bar.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/home/Telas/Register/profile/profile_screen.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/home/rest_api/BuscaUsers.dart';
import 'package:pharma_off/palheta/theme.dart';
import 'package:pharma_off/home/rest_api/LoginUser.dart';
import 'package:pharma_off/home/servicos/ComplementosServicos.dart';

import 'ForgotPwd/EsqueciSenha.dart';

var _userObject = {};

class LoginUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Login();
  }
}

class Login extends State<LoginUser> {
  static String NomeNavegacao = "/login";
  @override
  String emailUsuario;
  String senhaUsuario;
  bool isUserLogged = false;
  bool _showPassword = false;
  GlobalKey<FormState> _key = new GlobalKey();

  //chaves paras os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Widgets
  //E-mail
  bool _rememberMe = false;
  bool isLogged(userstatus) {
    if (userstatus == true) {
      isUserLogged = true;
      return isUserLogged;
    } else {
      isUserLogged = false;
      return isUserLogged;
    }
  }

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
        emailUsuario = value;
      },
    );
  }

  Widget _buildPasswordTF() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _showPassword == false ? true : false,
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
        suffixIcon: GestureDetector(
          child: Icon(
            _showPassword == false ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[800],
          ),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
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
        senhaUsuario = value;
      },
    );
  }

  Widget build(BuildContext context) {
    Widget _buildForgotPasswordBtn() {
      return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Esquecisenha.NomeNavegacao);
          },
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Esqueci minha senha',
          ),
        ),
      );
    }

    Widget _buildLoginBtn() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 55.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: _sendForm,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'LOGIN',
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

    Widget _buildSignupBtn() {
      return FlatButton(
        // onPressed: ()=> Navigator.pushNamed(context ),
        onPressed: () {
          Navigator.of(context).pushNamed(Cadastro.NomeNavegacao);
        },

        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Não possui conta? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Cadastre-se',
                style: TextStyle(
                  color: AzulPrimario,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",
            textScaleFactor: 1.1,
            style: TextStyle(color: AzulPrimario, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: new Container(
              margin: new EdgeInsets.all(15.0),
              child: new Form(
                key: _formKey,
                // autovalidate: _validate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/pharmaoff_logo_azul.png",
                      fit: BoxFit.fill,
                      height: 80.0,
                    ),
                    SizedBox(height: 50.0),
                    _buildEmailTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    // _buildEmailTF(),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildLoginBtn(),
                    _buildSignupBtn(),
                  ],
                ),
              ))),
    );
  }

  _sendForm() async {
    if (!_formKey.currentState.validate()) {
      print('dentro do if :${_formKey}');
      return;
    }
    _formKey.currentState.save();
    print('fora do if :${_formKey}');
    _formKey.currentState.save();
    var listUsers = await APIGetUsers().getAllUsers();
    var usuarios = listUsers.data;

    // Map userLogged = Complemento().getnameuser(usuarios, email);

    Map userLogged = Complemento().getUsersfromEmail(usuarios, emailUsuario);
    var response = await APILogin()
        .login(_userObject['email_usuario'], _userObject['pwd_usuario']);
    // print(response.token);
    // print('informacoes do usuario logado ${userLogged}');
    print("OLHAA AQUII O RESPONSE DATA >>${response}");
    // var responsee = await APILogin().login(email, senha);
    print("UserObject:${_userObject}");
    // print("RESPONSE:${response.data}");
    if (response.token != null) {
      print('deu tudo certo');

      // CustomBottomNavBar.islogged = true;
      SnackBar snackbar = new SnackBar(
        content: Text(
          "Usuário Logado com Sucesso!!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[600],
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //salvando dados do user
      Navigator.pushReplacementNamed(context, HomeScreen.NomeNavegacao);
      Complemento().saveDataUser(userLogged);
      print('Informacoes do usuario logado ${userLogged}');
    } else {
      SnackBar snackbar = new SnackBar(
        content: Text(
          "E-mail ou Senha Inválidos!!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[600],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pushReplacementNamed(context, Login.NomeNavegacao);
    }
  }
  //  else {
  // SnackBar snackbar = new SnackBar(
  // content: Text(
  // "Usuário não exite, faça o cadastro!!",
  // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  // ),
  // backgroundColor: Colors.red[600],
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackbar);
  // erro de validação
  // setState(() {
  // _validate = true;
  // });
  // }
  // }
}
