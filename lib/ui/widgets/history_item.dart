import 'package:flutter/material.dart';
import 'package:opolah/config/constants.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.name,
    required this.price,
    this.tab = 'history',
    this.clickCallback,
    this.cardClicked,
  }) : super(key: key);
  final String name, price;
  final String tab;
  final Function? clickCallback;
  final Function? cardClicked;

  // Utils util = Utils();

  Widget printStatus(String type) {
    switch (type) {
      case 'payment':
        return const Text("Waiting for Payment",
            style: TextStyle(
                color: colorSecondary1,
                fontSize: 12,
                fontWeight: FontWeight.bold));
      case 'history':
        return const Text("Finished",
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 12,
                fontWeight: FontWeight.bold));
      default:
        return Text("On Process",
            style: TextStyle(
                color: Colors.yellow[800],
                fontSize: 12,
                fontWeight: FontWeight.bold));
    }
  }

  String getMonth(String date) {
    switch (date.substring(3, 5)) {
      case "01":
        return "JAN";
      case "02":
        return "FEB";
      case "03":
        return "MAR";
      case "04":
        return "APR";
      case "05":
        return "MAY";
      case "06":
        return "JUN";
      case "07":
        return "JUL";
      case "08":
        return "AUG";
      case "09":
        return "SEP";
      case "10":
        return "OKT";
      case "11":
        return "NOV";
      case "12":
        return "DES";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardClicked == null ? () {} : cardClicked!(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // util.verticalLineMarker(
                //     height: 70, color: colorPrimary, width: 5),
                height5,
                SizedBox(
                  width: 225,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Transaction ID #213123142",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: colorPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      printStatus(tab),
                      const SizedBox(height: 15),
                      const Text("Rp 20.000.000",
                          style: TextStyle(
                              color: colorSecondary2,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            if (tab == 'payment')
              RaisedButton(
                onPressed: clickCallback!(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: colorPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const Text("Pay Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            if (tab == 'delivery')
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: colorPrimary, boxShadow: [shadow1]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "ON",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "GOING",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  )),
            if (tab == 'history')
              Container(
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(color: colorPrimary, boxShadow: [shadow1]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "12",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "AUG".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "2099",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
