import 'package:flutter/material.dart';
import 'package:opolah/ui/widgets/see_all.dart';
import 'package:opolah/ui/widgets/history_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeeAll(
              title: 'History',
              openMore: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => TransactionScreen(tabIndex: 2)));
              }),
          // final histories = state.transctionList
          //     .where((data) => data.getStatus)
          //     .toList();

          SizedBox(
            height: 300,
            width: size.width,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) => const HistoryItem(
                name: "John",
                price: "20.313.233",
              ),
            ),
          )

          // historyList.length == 0
          //     ? Container()
          //     : Container(
          //         height: 300,
          //         width: size.width,
          //         child: ListView.builder(
          //           padding: EdgeInsets.only(top: 10),
          //           scrollDirection: Axis.vertical,
          //           itemCount: historyList.length > 3 ? 3 : historyList.length,
          //           itemBuilder: (context, index) => HistoryItem(
          //             transactionItem: historyList[index],
          //             clickCallback: () {},
          //             cardClicked: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => ShippingScreen(
          //                           viewOnly: true,
          //                           address: historyList[index].getAddress,
          //                           choosen: historyList[index].getCarts,
          //                           totalItemPrice:
          //                               int.parse(historyList[index].getTotal) -
          //                                   int.parse(
          //                                       historyList[index].getCost))));
          //             },
          //           ),
          //         ),
          //       ),
        ],
      ),
    );
  }
}
