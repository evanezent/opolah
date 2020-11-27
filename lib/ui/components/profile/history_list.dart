import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/profile/history_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "HISTORY",
            style: TextStyle(
                color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(height: 10),
          HistoryItem(),
          HistoryItem(),
          HistoryItem(),
          HistoryItem()
        ],
      ),
    );
  }
}
