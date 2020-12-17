import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    Key key,
    this.text,
    this.onClick,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final Function onClick;
  final Color bgColor, textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
            height: 60,
            color: bgColor,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(colorPrimary),
                    ),
                  )
                : Center(
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
