import 'package:flutter/material.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

// ignore: must_be_immutable
class HistoryList extends StatelessWidget {
  HistoryList({Key key, this.historyList}) : super(key: key);

  List<TransactionClass> historyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(10),
        child: historyList.length == 0
            ? Container()
            : Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: historyList.length,
                  itemBuilder: (context, index) => HistoryItem(
                    transactionItem: historyList[index],
                    clickCallback: () {},
                    cardClicked: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShippingScreen(
                                  viewOnly: true,
                                  address: historyList[index].getAddress,
                                  choosen: historyList[index].getCarts,
                                  totalItemPrice: int.parse(
                                          historyList[index].getTotal) -
                                      int.parse(historyList[index].getCost))));
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
