import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/screens/cart/cart_screen.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      height: 60,
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShippingScreen()));
              },
              child: Container(
                  height: 60,
                  width: size.width * 0.7,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ))),
          InkWell(
              onTap: () {
                print('ADD TO CHART');
              },
              child: Container(
                  width: size.width * 0.3,
                  height: 60,
                  child: Center(
                      child: FaIcon(
                    FontAwesomeIcons.cartPlus,
                    color: Colors.white,
                  )))),
        ],
      ),
    );
  }
}
