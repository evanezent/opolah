import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/ui/screens/shop/detail_item.dart';
import 'package:opolah/models/item.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.size,
    this.nStar,
    this.name,
    this.price,
    this.imgUrl,
    this.item,
  }) : super(key: key);

  final Size size;
  final double nStar;
  final int price;
  final String name, imgUrl;
  final Item item;

  @override
  Widget build(BuildContext context) {
    double rate = item != null ? item.star.toDouble() : nStar;
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailItem()));
      },
      child: Container(
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
                item != null ? item.image : imgUrl,
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
                    item != null ? item.name : name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorPrimary, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Util.starCounter(nStar: rate),
                  SizedBox(height: 5),
                  Text(
                    item != null ? item.price.toString() : price.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
