import 'package:flutter/material.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/components/see_all.dart';
import 'package:opolah/ui/screens/profile/transaction_screen.dart';

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
          SizedBox(height: 10),
          historyList.length == 0
              ? Container()
              : Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) => HistoryItem(
                      transactionItem: historyList[index],
                      clickCallback: () {},
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
