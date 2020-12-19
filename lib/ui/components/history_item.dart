import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/screens/payment/payment_screen.dart';

// ignore: must_be_immutable
class HistoryItem extends StatelessWidget {
  HistoryItem({
    Key key,
    this.bgColor,
    this.textColor,
    this.name,
    this.price,
    this.tab = 'history',
    this.transactionItem,
  }) : super(key: key);

  final Color bgColor, textColor;
  final String name, price;
  final String tab;
  final TransactionClass transactionItem;

  Utils util = Utils();

  Widget printStatus(String type) {
    switch (type) {
      case 'payment':
        return Text("Waiting for Payment",
            style: TextStyle(
                color: colorSecondary,
                fontSize: 12,
                fontWeight: FontWeight.bold));
      case 'history':
        return Text("Finished",
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 12,
                fontWeight: FontWeight.bold));
      default:
        return Text("On Process",
            style: TextStyle(
                color: Colors.yellow[800],
                fontSize: 12,
                fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    String id = transactionItem == null ? "" : transactionItem.getID;
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: transactionItem == null
            ? 0
            : double.parse(transactionItem.getTotal));
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              util.verticalLineMarker(
                  height: 70, color: colorPrimary, width: 5),
              SizedBox(width: 20),
              Container(
                width: 225,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Transaction ID #$id",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    printStatus(tab),
                    SizedBox(height: 15),
                    Text("Rp ${fmf.output.nonSymbol}",
                        style: TextStyle(
                            color: colorBackup,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          if (tab == 'payment')
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 10),
              color: colorPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text("Pay Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          if (tab == 'delivery')
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: colorPrimary, boxShadow: bottomDarkShadow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ON",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "GOING",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                )),
          if (tab == 'history')
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: colorPrimary, boxShadow: bottomDarkShadow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "22",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "NOV",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "2020",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
        ],
      ),
      // child: Stack(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10), color: bgColor),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Row(
      //             children: [
      //               Container(
      //                 width: 60,
      //                 height: 60,
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.only(
      //                     topLeft: Radius.circular(10),
      //                     topRight: Radius.circular(10),
      //                     bottomRight: Radius.circular(10),
      //                     bottomLeft: Radius.circular(10),
      //                   ),
      //                   child: Image.network(
      //                     'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(width: 20),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Container(
      //                     child: Text(
      //                       name,
      //                       overflow: TextOverflow.ellipsis,
      //                       style: TextStyle(
      //                           color: colorPrimary,
      //                           fontSize: 15,
      //                           fontWeight: FontWeight.w700),
      //                     ),
      //                   ),
      //                   SizedBox(height: 7),
      //                   Util.starCounter(nStar: 5),
      //                   SizedBox(height: 7),
      //                   Container(
      //                     child: Text(
      //                       'Rp $price',
      //                       overflow: TextOverflow.ellipsis,
      //                       style: TextStyle(
      //                           fontSize: 15,
      //                           fontWeight: FontWeight.w700,
      //                           color: colorSecondary),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     if (tab == 'history')
      //       Positioned(
      //         top: 0,
      //         right: 20,
      //         child: Container(
      //           padding: EdgeInsets.all(5),
      //           decoration: BoxDecoration(
      //               color: colorPrimary, boxShadow: bottomDarkShadow),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "22",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w700),
      //               ),
      //               Text(
      //                 "NOV",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700),
      //               ),
      //               Text(
      //                 "2020",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w700),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     if (tab == 'payment')
      //       Positioned(
      //           top: 20,
      //           right: 20,
      //           child: RaisedButton(
      //               color: colorPrimary,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               onPressed: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => PaymentScreen()));
      //               },
      //               child: Text(
      //                 'Pay',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                 ),
      //               ))),
      //     if (tab == 'delivery')
      //       Positioned(
      //         top: 20,
      //         right: 20,
      //         child: Container(
      //           padding: EdgeInsets.all(5),
      //           decoration: BoxDecoration(
      //               color: colorPrimary, boxShadow: bottomDarkShadow),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "ON",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700),
      //               ),
      //               Text(
      //                 "GOING",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w200),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
