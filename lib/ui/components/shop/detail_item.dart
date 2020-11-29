import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:opolah/constant/constans.dart';

class DetailItem extends StatefulWidget {
  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
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
        child: Container(
          child: Image.asset(
            'assets/images/banner3.jpg',
            fit: BoxFit.cover,
          ),
        )),
  ];

  double _currentPageIndex = 0;
  double qty = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      autoPlay: false,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2 / 2,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPageIndex = index.toDouble();
                        });
                      },
                    ),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(boxShadow: darkShadow),
                          child: images[index],
                        )),
                Container(
                  child: DotsIndicator(
                    dotsCount: images.length,
                    position: _currentPageIndex,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeColor: colorPrimary,
                      color: colorSecondary,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Text(
                  "Sepatu Old School",
                  style: TextStyle(
                      color: colorPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp 120.000,-",
                  style: TextStyle(
                      color: colorSecondary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Size",
                  style: TextStyle(
                      color: Colors.blueGrey[200],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: CustomRadioButton(
                      enableButtonWrap: true,
                      unSelectedColor: Colors.white,
                      unSelectedBorderColor: Colors.white,
                      enableShape: true,
                      buttonLables: ["S", "M", "L", "XL"],
                      buttonValues: ["S", "M", "L", "XL"],
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: colorPrimary,
                      selectedBorderColor: colorPrimary,
                    ),
                  ),
                ),
                // Container(
                //   child: Counter(
                //     initialValue: 0,
                //     color: colorPrimary,
                //     textStyle: TextStyle(fontSize: 15),
                //     minValue: 0,
                //     maxValue: 1000,
                //     step: 1,
                //     decimalPlaces: 1,
                //     onChanged: (value) {
                //       setState(() {
                //         qty = value;
                //       });
                //     },
                //   ),
                // )
              ],
            ),
          )
        ],
      )),
    );
  }
}
