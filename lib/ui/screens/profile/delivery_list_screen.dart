import 'package:flutter/material.dart';
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
      body: deliveryList.length == 0
          ? Container()
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deliveryList.length,
                itemBuilder: (context, index) => HistoryItem(
                  transactionItem: deliveryList[index],
                  tab: "delivery",
                  clickCallback: () {},
                  cardClicked: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingScreen(
                                viewOnly: true,
                                address: deliveryList[index].getAddress,
                                choosen: deliveryList[index].getCarts,
                                totalItemPrice: int.parse(
                                        deliveryList[index].getTotal) -
                                    int.parse(deliveryList[index].getCost))));
                  },
                ),
              ),
            ),
    );
  }
}
