import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';

class TextFrom extends StatelessWidget {
  const TextFrom({
    Key key,
    this.keyword,
    this.value,
    this.width,
  }) : super(key: key);

  final String keyword, value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: keyword,
            style: TextStyle(
                color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
                color: colorPrimary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ])));
  }
}
