import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_state.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

class HistoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(colorPrimary),
              ),
            );
          } else if (state is TransactionSuccessLoad) {
            final histories =
                state.transctionList.where((data) => data.getStatus).toList();
                
            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: histories.length,
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
                                totalItemPrice:
                                    int.parse(histories[index].getTotal) -
                                        int.parse(histories[index].getCost))));
                  },
                ),
              ),
            );
          }
          return Container();
        },
      ),
      // historyList.length == 0
      //     ? Container()
      //     : Container(
      //         padding: EdgeInsets.all(10),
      //         child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: historyList.length,
      //           itemBuilder: (context, index) => HistoryItem(
      //             transactionItem: historyList[index],
      //             clickCallback: () {},
      //             cardClicked: () {
      //               Navigator.pushReplacement(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => ShippingScreen(
      //                           viewOnly: true,
      //                           address: historyList[index].getAddress,
      //                           choosen: historyList[index].getCarts,
      //                           totalItemPrice: int.parse(
      //                                   historyList[index].getTotal) -
      //                               int.parse(historyList[index].getCost))));
      //             },
      //           ),
      //         ),
      //       ),
    );
  }
}
