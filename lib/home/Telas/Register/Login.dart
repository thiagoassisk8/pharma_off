import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/palheta/theme.dart';



class Login extends StatelessWidget {


  bool _rememberMe = false;

  BuildContext get context => null;
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',

        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: AzulPrimario,
              ),
              hintText: 'Digite seu Email',

            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Senha',),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: AzulPrimario,
              ),
              hintText: 'Digite sua senha',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
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
        onPressed: (

            ) => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text('LOGIN',
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


 
  static String NomeNavegacao = "/login";
  @override
  Widget build(BuildContext context) {

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

      AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 90.0,
              ),
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
            ),
          )
      ),
    );


  }

}