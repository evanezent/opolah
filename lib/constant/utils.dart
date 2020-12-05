import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

/*
  Utility for Star Counter
*/
class StarCounter {
  StarCounter({this.nStar, this.size = 15});
  final double size, nStar;

  Widget build() {
    return Row(
      children: [
        for (var i = 1; i <= 5; i++)
          i <= nStar
              ? FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow[700],
                  size: size,
                )
              : FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.grey[200],
                  size: size,
                )
      ],
    );
  }
}

/*
  Vertical Line Marker
*/
class VerticalLineMarker {
  const VerticalLineMarker({
    Key key,
    this.height,
    this.width,
    this.color,
  });

  final double height, width;
  final Color color;

  Widget build() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
    );
  }
}

/*
  Utility for Icon to Copy
*/
class IconCopy {
  const IconCopy({
    Key key,
    @required String word,
  }) : text = word;

  final String text;

  Widget build() {
    return IconButton(
        icon: FaIcon(
          FontAwesomeIcons.copy,
          color: colorPrimary,
        ),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: text))
              .then((value) => Fluttertoast.showToast(
                    msg: "Copied to clipboard !",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.white,
                    textColor: colorPrimary,
                  ));
        });
  }
}
