import 'package:flutter/material.dart';

import 'package:pharma_off/palheta/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 10),
        Text(
          text,
          style: new TextStyle(fontSize: 19),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 5),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
