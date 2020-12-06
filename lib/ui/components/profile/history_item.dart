import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/ui/screens/payment/payment_screen.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key key,
    this.bgColor,
    this.textColor,
    this.name,
    this.price,
    // ignore: avoid_init_to_null
    this.shadow = null,
    this.tab = 'history',
  }) : super(key: key);

  final List<BoxShadow> shadow;
  final Color bgColor, textColor;
  final String name, price;
  final String tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: shadow),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: bgColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: colorPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 7),
                        StarCounter(nStar: 5, size: 12).build(),
                        SizedBox(height: 7),
                        Container(
                          child: Text(
                            'Rp $price',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: colorSecondary),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (tab == 'history')
            Positioned(
              top: 0,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: colorPrimary, boxShadow: bottomDarkShadow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "22",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "NOV",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "2020",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          if (tab == 'preparation')
            Positioned(
                top: 20,
                right: 20,
                child: RaisedButton(
                    color: colorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                    },
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))),
          if (tab == 'delivery')
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: colorPrimary, boxShadow: bottomDarkShadow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ON",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "GOING",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
