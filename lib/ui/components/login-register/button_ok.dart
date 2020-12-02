import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class ButtonOk extends StatelessWidget {
  const ButtonOk({
    Key key,
    @required this.size,
    this.onClick,
  }) : super(key: key);

  final Size size;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            onPressed: onClick,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Container(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ok",
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.w300,
                          fontSize: 20)),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.longArrowAltRight,
                    color: colorPrimary,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
