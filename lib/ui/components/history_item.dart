import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/models/transaction.dart';

// ignore: must_be_immutable
class HistoryItem extends StatelessWidget {
  HistoryItem({
    Key key,
    this.name,
    this.price,
    this.tab = 'history',
    this.transactionItem,
    this.clickCallback,
    this.cardClicked,
  }) : super(key: key);
  final String name, price;
  final String tab;
  final TransactionClass transactionItem;
  final Function clickCallback;
  final Function cardClicked;

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

  String getMonth(String date) {
    switch (date.substring(3, 5)) {
      case "01":
        return "JAN";
      case "02":
        return "FEB";
      case "03":
        return "MAR";
      case "04":
        return "APR";
      case "05":
        return "MAY";
      case "06":
        return "JUN";
      case "07":
        return "JUL";
      case "08":
        return "AUG";
      case "09":
        return "SEP";
      case "10":
        return "OKT";
      case "11":
        return "NOV";
      case "12":
        return "DES";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    String id = transactionItem == null ? "" : transactionItem.getID;
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: transactionItem == null
            ? 0
            : double.parse(transactionItem.getTotal));

    return InkWell(
      onTap: cardClicked,
      child: Container(
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
                onPressed: clickCallback,
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
                      transactionItem.getDate.substring(0, 2),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      getMonth(transactionItem.getDate),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      transactionItem.getDate
                          .substring(transactionItem.getDate.length - 2),
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
      ),
    );
  }
}
