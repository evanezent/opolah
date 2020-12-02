import 'package:flutter/material.dart';

class HeaderLoginRegister extends StatelessWidget {
  const HeaderLoginRegister({
    Key key,
    @required this.size,
    this.title,
    this.word,
  }) : super(key: key);

  final Size size;
  final String title, word;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60, left: 20),
      child: Row(
        children: [
          RotatedBox(
              quarterTurns: 3,
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60))),
          SizedBox(width: 20),
          Container(
            width: size.width * 0.6,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(word,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 32)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
