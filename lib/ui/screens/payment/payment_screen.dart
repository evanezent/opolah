import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/payment_card.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PageController _controller;

  // _goToDetail(Character character) {
  //   final page = DetailPage(character: character);
  //   Navigator.of(context).push(
  //     PageRouteBuilder<Null>(
  //         pageBuilder: (BuildContext context, Animation<double> animation,
  //             Animation<double> secondaryAnimation) {
  //           return AnimatedBuilder(
  //               animation: animation,
  //               builder: (BuildContext context, Widget child) {
  //                 return Opacity(
  //                   opacity: animation.value,
  //                   child: page,
  //                 );
  //               });
  //         },
  //         transitionDuration: Duration(milliseconds: 400)),
  //   );
  // }

  _pageListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_pageListener);
    _controller.dispose();
    super.dispose();
  }

  double _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                autoPlay: false,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPageIndex = index.toDouble();
                  });
                },
              ),
              itemBuilder: (context, index) => Container(
                    child: ListItem(
                      character: cards[index],
                      onTap: () {},
                    ),
                  )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: darkShadow,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentTextItem(
                  text1: "The Shop Master ",
                  text2: "1388 90123 8231 2",
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaymentTextItem(
                      text1: "Ammount ",
                      text2: "Rp 600.291",
                    ),
                    Container(
                      // alignment: Alignment.bottomRight,
                      child: Text(
                        "Don't forget about 3 unique code",
                        style: TextStyle(
                            color: colorSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class PaymentTextItem extends StatelessWidget {
  const PaymentTextItem({
    Key key,
    this.text1,
    this.text2,
  }) : super(key: key);

  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
              color: colorPrimary, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(
          text2,
          style: TextStyle(
              color: colorPrimary, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}

class ListItem extends StatelessWidget {
  final PaymentCard character;
  final VoidCallback onTap;

  const ListItem({
    Key key,
    @required this.character,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Hero(
            tag: "background_${character.title}",
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    character.image,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
