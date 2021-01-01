import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_state.dart';
import 'package:opolah/constant/constans.dart';
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
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(colorPrimary),
                  ),
                );
              } else if (state is TransactionSuccessLoad) {
                final histories = state.transctionList
                    .where((data) => data.getStatus)
                    .toList();

                return Container(
                  height: 300,
                  width: size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: histories.length > 3 ? 3 : histories.length,
                    itemBuilder: (context, index) => HistoryItem(
                      transactionItem: histories[index],
                      clickCallback: () {},
                      cardClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShippingScreen(
                                    viewOnly: true,
                                    address: histories[index].getAddress,
                                    choosen: histories[index].getCarts,
                                    totalItemPrice: int.parse(
                                            histories[index].getTotal) -
                                        int.parse(histories[index].getCost))));
                      },
                    ),
                  ),
                );
              }
              return Container();
            },
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
