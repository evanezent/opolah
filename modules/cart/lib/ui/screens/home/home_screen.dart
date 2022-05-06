import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home/ui/widgets/card_icon.dart';
import 'package:home/ui/widgets/search_bar.dart';
import 'package:opolah/utils/utility.dart';

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

  List images = [
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
                  // Container(
                  //   child: CarouselSlider.builder(
                  //     itemCount: 3,
                  //     options: CarouselOptions(
                  //       autoPlay: true,
                  //       autoPlayAnimationDuration: Duration(seconds: 2),
                  //       enlargeCenterPage: true,
                  //       viewportFraction: 0.9,
                  //       aspectRatio: 2.0,
                  //       initialPage: 1,
                  //     ),
                  //     itemBuilder: (context, index) => images[index],
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  Container(
                    child: Row(
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
                  ),
                  // BlocBuilder<ItemBloc, ItemState>(
                  //   builder: (context, state) {
                  //     if (state is ItemsLoading) {
                  //       return Center(
                  //           child: CircularProgressIndicator(
                  //         backgroundColor: Colors.white,
                  //         valueColor: AlwaysStoppedAnimation(colorPrimary),
                  //       ));
                  //     } else if (state is ItemsLoaded) {
                  //       return SliderItem(
                  //         size: size,
                  //         title: "Newcomer",
                  //         listItem: state.itemList,
                  //         openMore: () {},
                  //       );
                  //     }
                  //     return Container();
                  //   },
                  // ),
                  // BlocBuilder<ItemBloc, ItemState>(
                  //   builder: (context, state) {
                  //     if (state is ItemsLoading) {
                  //       return Center(
                  //           child: CircularProgressIndicator(
                  //         backgroundColor: Colors.white,
                  //         valueColor: AlwaysStoppedAnimation(colorPrimary),
                  //       ));
                  //     } else if (state is ItemsLoaded) {
                  //       return SliderItem(
                  //         size: size,
                  //         title: "Popular",
                  //         listItem: state.itemList,
                  //         openMore: () {},
                  //       );
                  //     }
                  //     return Container();
                  //   },
                  // ),
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
