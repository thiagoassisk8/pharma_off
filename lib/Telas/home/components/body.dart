import 'package:flutter/material.dart';
import 'package:pharma_off/Telas/home/components/suporte.dart';
import 'package:pharma_off/Telas/search.dart';


import '../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Search(),

          ],
        ),
      ),
    );
  }
}