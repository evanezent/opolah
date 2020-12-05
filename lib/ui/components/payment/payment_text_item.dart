import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';

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
