import 'package:flutter/material.dart';

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
