import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/repositories/transaction_repo.dart';
import 'package:opolah/ui/screens/profile/delivery_list_screen.dart';
import 'package:opolah/ui/screens/profile/history_list_screen.dart';
import 'package:opolah/ui/screens/profile/payment_list_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key key, this.tabIndex = 0}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();

  final int tabIndex;
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<Tab> myTabs = <Tab>[
    Tab(
      icon: FaIcon(
        FontAwesomeIcons.gift,
        size: 18,
      ),
      text: 'Payments',
    ),
    Tab(
      icon: FaIcon(FontAwesomeIcons.truck, size: 18),
      text: 'Delivery',
    ),
    Tab(
      icon: FaIcon(FontAwesomeIcons.history, size: 18),
      text: 'History',
    )
  ];

  List<TransactionClass> transactionList = [];
  List<TransactionClass> deliveryList = [];
  List<TransactionClass> historyList = [];

  TransactionRepository _transactionRepository = TransactionRepository();
  void getAllTransaction() async {
    var data = await _transactionRepository.getStream();

    for (var transaction in data) {
      if (transaction.getProof == "") {
        setState(() {
          transactionList.add(transaction);
        });
      } else if (transaction.getStatus == false) {
        setState(() {
          deliveryList.add(transaction);
        });
      } else if (transaction.getStatus) {
        setState(() {
          historyList.add(transaction);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.tabIndex,
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Transaction'),
          centerTitle: true,
          backgroundColor: colorPrimary,
          bottom: TabBar(indicatorColor: Colors.white, tabs: myTabs),
        ),
        body: TabBarView(
          children: [
            PaymentList(transactionList: transactionList),
            DeliveryList(deliveryList: deliveryList),
            HistoryList(historyList: historyList)
          ],
        ),
      ),
    );
  }
}
