import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
              ),
            child: Carousel(
              images: [
                Container(decoration: BoxDecoration(color: colorPrimary)),
                Container(decoration: BoxDecoration(color: Colors.white)),
                Container(decoration: BoxDecoration(color: colorSecondary)),
              ],
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.bottomCenter,
              dotIncreasedColor: colorPrimary,
              dotSpacing: 12,
            ),
          )
        ],
      ),
    );
  }
}
