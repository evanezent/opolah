import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/models/cart.dart';

// ignore: must_be_immutable
class ShippingItem extends StatelessWidget {
  ShippingItem({
    Key key,
    this.choosenItem,
  }) : super(key: key);

  final Cart choosenItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    choosenItem.getItem.getImage,
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
                      choosenItem.getItem.getName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 7),
                  Util.starCounter(nStar: 5, size: 10),
                  SizedBox(height: 7),
                  Container(
                    child: Text(
                      'Rp ${choosenItem.getItem.getPrice}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: colorSecondary),
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(
            "x ${choosenItem.getQuantity}",
            style: TextStyle(
                color: colorPrimary, fontSize: 20, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
