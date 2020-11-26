import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          // Container(
          //   height: 250,
          //   padding: EdgeInsets.all(15),
          //   child: Carousel(
          //     images: [
          //       Container(decoration: BoxDecoration(color: colorPrimary)),
          //       Container(decoration: BoxDecoration(color: Colors.white)),
          //       Container(decoration: BoxDecoration(color: colorSecondary)),
          //     ],
          //     autoplay: true,
          //     animationCurve: Curves.fastOutSlowIn,
          //     animationDuration: Duration(milliseconds: 1000),
          //     dotBgColor: Colors.transparent,
          //     dotPosition: DotPosition.bottomCenter,
          //     dotIncreasedColor: colorPrimary,
          //     dotSpacing: 12,
          //   ),
          // ),
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
          Container(
            margin: EdgeInsets.all(10),
            // child: Carousel.s,
          )
          // child: Row(
          //   children: [
          //     CardItem(
          //       size: size,
          //       imgUrl:
          //           'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
          //       nStar: 5,
          //       name: 'Space-Star Art Tshirt',
          //       price: '75.000',
          //     ),
          //     CardItem(
          //       size: size,
          //       imgUrl:
          //           'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
          //       nStar: 5,
          //       name: 'Space-Star Art Tshirt',
          //       price: '75.000',
          //     ),
          //     CardItem(
          //       size: size,
          //       imgUrl:
          //           'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
          //       nStar: 5,
          //       name: 'Space-Star Art Tshirt',
          //       price: '75.000',
          //     ),
          //     CardItem(
          //       size: size,
          //       imgUrl:
          //           'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
          //       nStar: 5,
          //       name: 'Space-Star Art Tshirt',
          //       price: '75.000',
          //     ),
          //   ],
          // ),
          // )
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.size,
    this.nStar,
    this.name,
    this.price,
    this.imgUrl,
  }) : super(key: key);

  final Size size;
  final int nStar;
  final String name, price, imgUrl;

  Widget loopStar(nStar) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          i < nStar
              ? FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow[700],
                  size: 15,
                )
              : FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.grey[200],
                  size: 15,
                )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: darkShadow,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(imgUrl),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: colorPrimary, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    loopStar(nStar),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: 63,
          height: 63,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: darkShadow),
          child: Column(
            children: [
              FaIcon(
                icon,
                color: colorPrimary,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                ),
              )
            ],
          )),
    );
  }
}
