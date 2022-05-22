import 'package:flutter/material.dart';
import 'package:home/models/item.dart';
import 'package:opolah/config/constants.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  CardItem({
    Key? key,
    required this.size,
    this.nStar = 0,
    this.name,
    this.price,
    this.imgUrl,
    this.item,
  }) : super(key: key);

  final Size size;
  double? nStar;
  double? price;
  String? name, imgUrl;
  Item? item;

  @override
  Widget build(BuildContext context) {
    name = item != null ? item!.name : name;
    price = item != null ? item!.price : price;
    imgUrl = item != null ? item!.image : imgUrl;
    double rate = item != null ? item!.star : nStar!;
    // FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: price);

    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => DetailItem(item: item)));
      },
      child: Container(
        width: size.width * 0.4,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset.zero,
                  blurRadius: 6,
                  color: colorBlack.withOpacity(0.2))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imgUrl ?? '',
                height: 170.0,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: colorPrimary, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 5),
                  Text(
                    "RP ${price}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: colorSecondary1),
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
