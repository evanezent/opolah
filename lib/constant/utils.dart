import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class Utils {
  /*
  Utility for Show Toast
  */
  void successToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: colorPrimary,
    );
  }

  void errorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: colorSecondary,
    );
  }

  /*
  Utility for Star Counter
  */
  Widget starCounter({double size = 12, double nStar}) {
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

  /*
  Vertical Line Marker
  */
  Widget verticalLineMarker({double height, double width, Color color}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
    );
  }

  /*
  Utility for Icon to Copy
  */
  Widget copyIcon({String targetCopy, Color iconColor = colorPrimary}) {
    return IconButton(
        icon: FaIcon(
          FontAwesomeIcons.copy,
          color: iconColor,
        ),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: targetCopy))
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

// ignore: non_constant_identifier_names
final Utils Util = Utils();
