import 'package:flutter/material.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/screens/payment/payment_screen.dart';

// ignore: must_be_immutable
class PaymentList extends StatelessWidget {
  PaymentList({Key key, this.transactionList}) : super(key: key);

  List<TransactionClass> transactionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: transactionList.length == 0
          ? Container()
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: transactionList.length,
                itemBuilder: (context, index) => HistoryItem(
                  transactionItem: transactionList[index],
                  tab: 'payment',
                  clickCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                                total: double.parse(
                                    transactionList[index].getTotal),
                                transactionID: transactionList[index].getID)));
                  },
                ),
              ),
            ),
    );
  }
}
