import 'package:flutter/material.dart';
import 'package:opolah/models/payment_card.dart';

class PaymentCardItem extends StatelessWidget {
  final PaymentCard card;
  final VoidCallback onTap;

  const PaymentCardItem({
    Key key,
    @required this.card,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Hero(
            tag: "background_${card.title}",
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    card.image,
                    // height: 500,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
