import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({
    Key key,
    @required this.title,
    @required this.openMore,
  }) : super(key: key);

  final String title;
  final Function openMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          InkWell(
            onTap: openMore,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorPrimary,
              ),
              child: Text(
                "See all",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }
}
