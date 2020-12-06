import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/history_item.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            HistoryItem(
                bgColor: Colors.white,
                textColor: colorPrimary,
                shadow: darkShadow,
                name: 'Space Milk T-Shirt',
                price: '99.500,00'),
            HistoryItem(
                bgColor: Colors.white,
                textColor: colorPrimary,
                shadow: darkShadow,
                name: 'Space Milk T-Shirt',
                price: '99.500,00'),
            HistoryItem(
                bgColor: Colors.white,
                textColor: colorPrimary,
                shadow: darkShadow,
                name: 'Space Milk T-Shirt',
                price: '99.500,00'),
          ],
        ),
      ),
    );
  }
}
