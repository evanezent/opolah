import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/screens/profile/delivery_list_screen.dart';
import 'package:opolah/ui/screens/profile/history_list_screen.dart';
import 'package:opolah/ui/screens/profile/payment_list_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key key, this.tabIndex = 0, this.userID})
      : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();

  final int tabIndex;
  final userID;
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

  @override
  void initState() {
    super.initState();
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
            PaymentList(),
            DeliveryList(),
            HistoryList()
          ],
        ),
      ),
    );
  }
}
