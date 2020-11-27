import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/CardIcon.dart';
import 'package:opolah/ui/components/home/SliderItem.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  List images = [
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colorPrimary)),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white)),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colorSecondary)),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 1,
              ),
              itemBuilder: (context, index) => images[index],
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardIcon(
                  icon: FontAwesomeIcons.tshirt,
                  title: "Cloth",
                ),
                CardIcon(
                  icon: FontAwesomeIcons.mobile,
                  title: "Mobile",
                ),
                CardIcon(
                  icon: FontAwesomeIcons.laptop,
                  title: "Computer",
                ),
                CardIcon(
                  icon: FontAwesomeIcons.theaterMasks,
                  title: "Hobbies",
                ),
                CardIcon(
                  icon: FontAwesomeIcons.book,
                  title: "Books",
                ),
              ],
            ),
          ),
          SliderItem(
            size: size,
            title: "Newcomer",
            openMore: () {},
          ),
          SliderItem(
            size: size,
            title: "Popular",
            openMore: () {},
          )
        ],
      ),
    );
  }
}
