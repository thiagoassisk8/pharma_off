import 'package:flutter/material.dart';
import 'package:pharma_off/Telas/home/components/mappage.dart';

import '../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            MapPage(),
          ],
        ),
      ),
    );
  }
}
