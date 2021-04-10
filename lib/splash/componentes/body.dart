import 'package:flutter/material.dart';
import 'package:pharma_off/home/home_screen.dart';
import 'package:pharma_off/palheta/size_config.dart';
import 'package:pharma_off/palheta/theme.dart';
import '../componentes/splash_content.dart';
import 'package:pharma_off/splash/componentes/default_button.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body> {


  int currentPage = 0;
  List<Map<String, String>> splashData = [
    
    {
      "text": "Seja Bem Vindo ao ",
      "image": "assets/images/pharmaoff_logo_azul.png"
    },
    {
      "text":
          "Encontre as Farmácias mais próximas de você!\nEm qualquer lugar",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Encontre Cupons e Descontos \nna palma da sua mão!",
      "image": "assets/images/cupom.png"
    },
  ];


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, HomeScreen.NomeNavegacao);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
