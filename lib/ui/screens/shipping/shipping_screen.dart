import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/ui/components/horizontal_divider.dart';
import 'package:opolah/ui/components/shipping/shipping_item.dart';
import 'package:opolah/ui/components/shipping/text_from.dart';

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
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: colorPrimary,
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
                                  color: Colors.white,
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
                    TextFrom(
                        keyword: "From : ",
                        width: size.width,
                        value: "The Shop"),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          Container(
                            width: 200,
                            child: Text(
                                'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 40278',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.pen,
                                size: 17, color: Colors.white),
                            onPressed: () {
                              print("CHANGE ADDRESS");
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white,
                      height: 300,
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
                            FontAwesomeIcons.truck,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Shipping costs : Rp 20.000.00",
                            style: TextStyle(
                                color: Colors.white,
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
                          color: Colors.white,
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
        textColor: colorPrimary,
        bgColor: Colors.white,
        onClick: () {},
      ),
    );
  }
}

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    Key key,
    this.text,
    this.onClick,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Function onClick;
  final Color bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
            height: 60,
            color: bgColor,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }
}
