import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  Widget loopStar(nStar, {double size = 15}) {
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
