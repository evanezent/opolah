import 'package:flutter/material.dart';

class ChangePageLoginRegister extends StatelessWidget {
  const ChangePageLoginRegister({
    Key key,
    this.question,
    this.change,
    this.onClick,
  }) : super(key: key);

  final String question, change;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Text(question,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 17)),
          SizedBox(width: 10),
          InkWell(
            onTap: onClick,
            child: Text(change,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
          )
        ],
      ),
    );
  }
}
