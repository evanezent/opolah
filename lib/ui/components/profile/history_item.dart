import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils util = Utils();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(boxShadow: darkShadow),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: colorPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Space-Star Art Tshirt',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 7),
                        util.loopStar(5),
                        SizedBox(height: 7),
                        Container(
                          child: Text(
                            'Rp 75.000',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: colorSecondary),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(color: Colors.white, boxShadow: lightShadow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "22",
                    style: TextStyle(
                        color: colorBackup,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "NOV",
                    style: TextStyle(
                        color: colorBackup,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "2020",
                    style: TextStyle(
                        color: colorBackup,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}