import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';

// ignore: must_be_immutable
class DeliveryList extends StatelessWidget {
  DeliveryList({Key key, this.deliveryList}) : super(key: key);

  List<TransactionClass> deliveryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: deliveryList.length == 0
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(colorPrimary),
            ))
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deliveryList.length,
                itemBuilder: (context, index) => HistoryItem(
                  transactionItem: deliveryList[index],
                  clickCallback: () {},
                ),
              ),
            ),
    );
  }
}
