import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.size,
    this.nStar,
    this.name,
    this.price,
    this.imgUrl,
  }) : super(key: key);

  final Size size;
  final double nStar;
  final String name, price, imgUrl;

  Widget loopStar(nStar) {
    return Row(
      children: [
        for (var i = 1; i <= 5; i++)
          i <= nStar
              ? FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow[700],
                  size: 15,
                )
              : FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.grey[200],
                  size: 15,
                )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.4,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: darkShadow,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              imgUrl,
              height: 170.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: colorPrimary, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    loopStar(nStar),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
