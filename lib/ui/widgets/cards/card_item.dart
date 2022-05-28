import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/models/item.dart';
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

    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => DetailItem(item: item)));
        },
        child: Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
              color: colorWhite,
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
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: colorPrimary),
                    ),
                    height1,
                    Text(
                      "RP ${price}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: colorSecondary1, fontWeight: FontWeight.w600),
                    ),
                    height2,
                    Wrap(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: colorYellow,
                          size: 12,
                        ),
                        width1,
                        const Text(
                          "4.5",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: colorDisable1,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          color: colorDisable1,
                          width: 1,
                          height: 12,
                        ),
                        const Text(
                          "Terjual 1.6k",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: colorDisable1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
