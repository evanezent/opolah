import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/bottom_nav_button.dart';
import 'package:opolah/ui/components/horizontal_divider.dart';
import 'package:opolah/ui/components/shipping/address_card.dart';
import 'package:opolah/ui/components/shipping/shipping_item.dart';
import 'package:opolah/ui/screens/payment/payment_screen.dart';

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: colorSecondary,
                child: FaIcon(FontAwesomeIcons.times, color: Colors.white),
              ),
            ),
            Center(
              child: Container(
                height: size.height * 0.7,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: darkShadow),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Your Shipping",
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                          ]))),
                    ),
                    SizedBox(height: 8),
                    HorizontalDivider(
                      width: 70,
                    ),
                    SizedBox(height: 20),
                    Text('Delivery Address',
                        style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                                height: 150,
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  AddressCard(
                                      size: size,
                                      name: 'Pratama Yoga',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: true,
                                      onChoose: () {}),
                                  AddressCard(
                                      size: size,
                                      name: 'Santosa Mike',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: false,
                                      onChoose: () {}),
                                  AddressCard(
                                      size: size,
                                      name: 'Billie Joe',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: false,
                                      onChoose: () {}),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      height: 200,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          ShippingItem(),
                          ShippingItem(),
                          ShippingItem(),
                          ShippingItem(),
                          ShippingItem(),
                          ShippingItem(),
                        ],
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bars,
                            color: colorPrimary,
                            size: 12,
                          ),
                          FaIcon(
                            FontAwesomeIcons.truck,
                            color: colorPrimary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rp 20.000.00",
                            style: TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HorizontalDivider(
                          width: 270,
                        ),
                        SizedBox(width: 10),
                        FaIcon(
                          FontAwesomeIcons.plus,
                          size: 15,
                          color: colorPrimary,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Shipping",
                            style: TextStyle(
                                color: colorSecondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                          Text(
                            "Rp 600.000.00",
                            style: TextStyle(
                                color: colorSecondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        text: "CONFIRM",
        bgColor: colorPrimary,
        textColor: Colors.white,
        onClick: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PaymentScreen()));
        },
      ),
    );
  }
}
