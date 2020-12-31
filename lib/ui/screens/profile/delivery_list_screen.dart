import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_state.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/ui/components/history_item.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

// ignore: must_be_immutable
class DeliveryList extends StatelessWidget {
  DeliveryList({Key key, this.deliveryList}) : super(key: key);

  List<TransactionClass> deliveryList = [];

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
            final deliveries = state.transctionList
                .where((data) => data.getStatus == false)
                .toList();

            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deliveries.length,
                itemBuilder: (context, index) => HistoryItem(
                  transactionItem: deliveries[index],
                  tab: "delivery",
                  clickCallback: () {},
                  cardClicked: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingScreen(
                                viewOnly: true,
                                address: deliveries[index].getAddress,
                                choosen: deliveries[index].getCarts,
                                totalItemPrice:
                                    int.parse(deliveries[index].getTotal) -
                                        int.parse(deliveries[index].getCost))));
                  },
                ),
              ),
            );
          }
          return Container();
        },
      ),
      // deliveryList.length == 0
      //     ? Container()
      //     : Container(
      //         padding: EdgeInsets.all(10),
      //         child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: deliveryList.length,
      //           itemBuilder: (context, index) => HistoryItem(
      //             transactionItem: deliveryList[index],
      //             tab: "delivery",
      //             clickCallback: () {},
      //             cardClicked: () {
      //               Navigator.pushReplacement(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => ShippingScreen(
      //                           viewOnly: true,
      //                           address: deliveryList[index].getAddress,
      //                           choosen: deliveryList[index].getCarts,
      //                           totalItemPrice: int.parse(
      //                                   deliveryList[index].getTotal) -
      //                               int.parse(deliveryList[index].getCost))));
      //             },
      //           ),
      //         ),
      //       ),
    );
  }
}
