import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/ui/components/shipping/shipping_item.dart';

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
        body: Center(
          child: Container(
            height: size.height * 0.7,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: wideShadow),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Your Shipping",
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
                SizedBox(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ShippingItem(),
                      ShippingItem(),
                      ShippingItem(),
                      ShippingItem(),
                    ],
                  )),
                ),
                Container(
                  color: colorPrimary,
                  height: 1,
                  width: 250,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: colorSecondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Text(
                        "Rp 600.000.00",
                        style: TextStyle(
                            color: colorSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
