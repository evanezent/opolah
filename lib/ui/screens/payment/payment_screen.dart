import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/payment_card.dart';
import 'package:opolah/ui/components/bottom_nav_button.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
  }

  double _currentPageIndex = 0;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Payment Gateway"),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      body: ListView(
        children: [
          CarouselSlider.builder(
              itemCount: cards.length,
              options: CarouselOptions(
                autoPlay: false,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 3 / 2,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPageIndex = index.toDouble();
                  });
                },
              ),
              itemBuilder: (context, index) => Container(
                    child: PaymentCardItem(
                      card: cards[index],
                      onTap: () {},
                    ),
                  )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(cards[_currentPageIndex.toInt()].color),
                        ),
                      ),
                      SizedBox(width: 10),
                      PaymentTextItem(
                          text1: "The Shop Master ",
                          text2: cards[_currentPageIndex.toInt()].accNumber),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.copy,
                            color: colorPrimary,
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                    text:
                                        '${cards[_currentPageIndex.toInt()].accNumber}'))
                                .then((value) => Fluttertoast.showToast(
                                      msg: "Coppied to clipboard !",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green[300],
                                      textColor: Colors.white,
                                    ));
                            // showToast(
                            //       msg: "Coppied to clipboard !",
                            //       toastLength: Toast.LENGTH_SHORT,
                            //       gravity: ToastGravity.BOTTOM,
                            //       backgroundColor: Colors.green[300],
                            //       textColor: Colors.white,
                            //     ));
                          })
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorSecondary,
                        ),
                      ),
                      SizedBox(width: 10),
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
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text('Upload Payment',
                style: TextStyle(
                    color: colorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          InkWell(
            onTap: getImage,
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _image == null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.paperclip,
                              color: colorPrimary,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Upload Here',
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    : Image.file(_image)),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNav(
        bgColor: colorPrimary,
        textColor: Colors.white,
        onClick: () {},
        text: "DONE",
      ),
    );
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
        Text(text1,
            style: TextStyle(
                color: colorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          text2,
          style: TextStyle(
              color: colorPrimary, fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ],
    ));
  }
}

class PaymentCardItem extends StatelessWidget {
  final PaymentCard card;
  final VoidCallback onTap;

  const PaymentCardItem({
    Key key,
    @required this.card,
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
            tag: "background_${card.title}",
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
                    card.image,
                    // height: 500,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
