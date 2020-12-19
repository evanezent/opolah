import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({Key key, this.transactionList}) : super(key: key);

  final List<TransactionClass> transactionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: transactionList.length,
          itemBuilder: (context, index) => HistoryItem(
            transactionItem: transactionList[index],
            bgColor: Colors.transparent,
            textColor: colorPrimary,
            name: 'Space Milk T-Shirt',
            price: '99.500,00',
            tab: 'payment',
          ),
          // children: [
          //   HistoryItem(
          //     bgColor: Colors.transparent,
          //     textColor: colorPrimary,
          //     name: 'Space Milk T-Shirt',
          //     price: '99.500,00',
          //     tab: 'payment',
          //   ),
          //   HistoryItem(
          //     bgColor: Colors.transparent,
          //     textColor: colorPrimary,
          //     name: 'Space Milk T-Shirt',
          //     price: '99.500,00',
          //     tab: 'payment',
          //   ),
          //   HistoryItem(
          //     bgColor: Colors.transparent,
          //     textColor: colorPrimary,
          //     name: 'Space Milk T-Shirt',
          //     price: '99.500,00',
          //     tab: 'payment',
          //   ),
          // ],
        ),
      ),
    );
  }
}
