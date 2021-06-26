import 'package:flutter/material.dart';
import 'package:pharma_off/home/Telas/Register/cadastro.dart';
import 'package:pharma_off/home/rest_api/EsqueciSenha.dart';
import 'package:pharma_off/palheta/theme.dart';

import 'package:pharma_off/splash/componentes/default_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_off/palheta/size_config.dart';
import 'package:pharma_off/home/Telas/Register/ForgotPwd/components/constants.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ainda não tem uma conta? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Cadastro.NomeNavegacao),
          child: Text(
            "Cadastre-se",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16), color: AzulPrimario),
          ),
        ),
      ],
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}

class BodyEsqueciSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Esqueceu sua senha??",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\nPor favor digite o email cadastrado \ne enviaremos o link de restauração",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  var _userObject = {};
  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,

            // onSaved: (newValue) => email = newValue,
            onSaved: (String value) {
              _userObject['email_usuario'] = value;
            },
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(EmailNullError)) {
                setState(() {
                  errors.remove(EmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(InvalidEmailError)) {
                setState(() {
                  errors.remove(InvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(EmailNullError)) {
                setState(() {
                  errors.add(EmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(InvalidEmailError)) {
                setState(() {
                  errors.add(InvalidEmailError);
                });
              }
              return null;
            },

            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Digite seu email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              text: "Enviar",
              press: () async {
                if (!_formKey.currentState.validate()) {
                  return null;
                } else if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  var response = await APIForgottenPwd().forgotPassword(
                    _userObject['email_usuario'],
                  );
                  print(
                      "OLHA AQUI PORRA  O RESPONSE STATUS>>${response.status}");

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
              }
              // },
              ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
