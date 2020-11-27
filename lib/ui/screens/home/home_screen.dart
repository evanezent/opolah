import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/ui/components/card_icon.dart';
import 'package:opolah/ui/components/home/search_bar.dart';
import 'package:opolah/ui/components/home/slider_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List images = [
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: Image.asset(
        'assets/images/banner1.jpg',
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.asset(
          'assets/images/banner2.jpg',
          fit: BoxFit.cover,
        )),
    ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.asset(
          'assets/images/banner3.jpg',
          fit: BoxFit.cover,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SearchBar(),
          SizedBox(height: 20),
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
