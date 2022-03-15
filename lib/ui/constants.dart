import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;

class RGBColor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8,0.0),
          colors: [
            Color(0xfffc00ff),
            Color(0xff00dbe)
          ]
        )
      ),
    );
  }
}

