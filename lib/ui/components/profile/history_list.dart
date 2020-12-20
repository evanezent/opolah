import 'package:flutter/material.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/components/see_all.dart';
import 'package:opolah/ui/screens/profile/transaction_screen.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

// ignore: must_be_immutable
class HistoryList extends StatelessWidget {
  HistoryList({Key key, @required this.size, this.historyList})
      : super(key: key);

  final Size size;
  List<TransactionClass> historyList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeeAll(
              title: 'History',
              openMore: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransactionScreen(tabIndex: 2)));
              }),
          historyList.length == 0
              ? Container()
              : Container(
                  height: 300,
                  width: size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: historyList.length > 3 ? 3 : historyList.length,
                    itemBuilder: (context, index) => HistoryItem(
                      transactionItem: historyList[index],
                      clickCallback: () {},
                      cardClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShippingScreen(
                                    viewOnly: true,
                                    address: historyList[index].getAddress,
                                    choosen: historyList[index].getCarts,
                                    totalItemPrice:
                                        int.parse(historyList[index].getTotal) -
                                            int.parse(
                                                historyList[index].getCost))));
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
