import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/ui/screens/shop/detail_item.dart';
import 'package:opolah/models/item.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  CardItem({
    Key key,
    @required this.size,
    this.nStar,
    this.name,
    this.price,
    this.imgUrl,
    this.item,
  }) : super(key: key);

  final Size size;
  double nStar;
  double price;
  String name, imgUrl;
  Item item;

  @override
  Widget build(BuildContext context) {
    imgUrl = item != null ? item.image : imgUrl;
    name = item != null ? item.name : name;
    double rate = item != null ? item.star : nStar;
    price = item != null ? item.price : price;
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: price);

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
                  Util.starCounter(nStar: rate),
                  SizedBox(height: 5),
                  Text(
                    "RP ${fmf.output.nonSymbol}",
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
