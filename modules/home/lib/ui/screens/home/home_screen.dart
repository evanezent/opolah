import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/ui/widgets/cards/card_icon.dart';
import 'package:opolah/ui/widgets/search_bar.dart';
import 'package:opolah/ui/widgets/slider_item.dart';
import 'package:opolah/utils/utility.dart';
import 'package:opolah/helper/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  List<Widget> images = [
    ClipRRect(
      borderRadius: const BorderRadius.only(
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
        borderRadius: const BorderRadius.only(
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
        borderRadius: const BorderRadius.only(
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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 20),
                  CarouselSlider(
                    items: images,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 1,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CardIcon(
                        icon: FontAwesomeIcons.shirt,
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
                  SliderItem(
                    size: size,
                    title: "Newcomer",
                    listItem: dummyItem,
                    openMore: () {},
                  ),
                  SliderItem(
                    size: size,
                    title: "Popular",
                    listItem: dummyItem!,
                    openMore: () {},
                  )
                ],
              ),
            ),
            const SearchBar(),
          ],
        ),
      ),
    );
  }
}
